
import type { Request, Response } from "express";
import type { Prisma } from "@prisma/client";
import { prisma } from "../../index";

// Return all assets, risks and incidents with optional search filtering
export const searchesAllDetails = async (req: Request, resp: Response) => {
    try {
        const searchTerm = typeof req.query.q === "string"
            ? req.query.q.trim()
            : "";

        const searchFilter: Prisma.AssetWhereInput | undefined = searchTerm
            ? {
                OR: [
                    { assetName: { contains: searchTerm, mode: "insensitive" as const } },
                    { location: { contains: searchTerm, mode: "insensitive" as const } },
                    { serialNo: { contains: searchTerm, mode: "insensitive" as const } },
                ],
            }
            : undefined;

        const riskSearchFilter: Prisma.RiskWhereInput | undefined = searchTerm
            ? {
                OR: [
                    { riskTitle: { contains: searchTerm, mode: "insensitive" as const } },
                    { riskDescription: { contains: searchTerm, mode: "insensitive" as const } },
                ],
            }
            : undefined;

        const incidentSearchFilter: Prisma.IncidentWhereInput | undefined = searchTerm
            ? {
                OR: [
                    { incidentTitle: { contains: searchTerm, mode: "insensitive" as const } },
                    { description: { contains: searchTerm, mode: "insensitive" as const } },
                ],
            }
            : undefined;

        const [assets, risks, incidents] = await Promise.all([
            prisma.asset.findMany({
                ...(searchFilter ? { where: searchFilter } : {}),
                include: {
                    compliances: true,
                    hazards: true,
                    incidents: true,
                },
                orderBy: { createdAt: "desc" },
            }),
            prisma.risk.findMany({
                ...(riskSearchFilter ? { where: riskSearchFilter } : {}),
                include: {
                    hazard: true,
                    incidents: true,
                },
                orderBy: { createdAt: "desc" },
            }),
            prisma.incident.findMany({
                ...(incidentSearchFilter ? { where: incidentSearchFilter } : {}),
                include: {
                    asset: true,
                    risk: true,
                    reportedBy: true,
                },
                orderBy: { createdAt: "desc" },
            }),
        ]);

        return resp.status(200).json({
            assets,
            risks,
            incidents,
            total: assets.length + risks.length + incidents.length,
        });
    } catch (error) {
        console.error("Error fetching all search details:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};


// Return all searchable data (Assets, Risks & Incidents)

export const getAssetsRisksIncidents = async (
  req: Request,
  resp: Response
) => {
  try {
    const [assets, risks, incidents] = await Promise.all([
      prisma.asset.findMany({
        include: {
          compliances: true,
          hazards: true,
          incidents: true,
        },
        orderBy: {
          createdAt: "desc",
        },
      }),

      prisma.risk.findMany({
        include: {
          hazard: {
            include: {
              asset: true,
            },
          },
          incidents: true,
        },
        orderBy: {
          createdAt: "desc",
        },
      }),

      prisma.incident.findMany({
        include: {
          asset: true,
          risk: true,
          reportedBy: true,
        },
        orderBy: {
          createdAt: "desc",
        },
      }),
    ]);

    const searchResults = [

      // ============================
      // ASSETS
      // ============================

      ...assets.map((asset) => ({
        id: asset.assetId,
        type: "ASSET",
        title: asset.assetName,
        subtitle: asset.location,
        status: asset.status,
        icon: "apartment",

        searchText: [
          asset.assetName,
          asset.location,
          asset.status,
        ]
          .filter(Boolean)
          .join(" ")
          .toLowerCase(),

        object: asset,
      })),

      // ============================
      // RISKS
      // ============================

      ...risks.map((risk) => ({
        id: risk.riskId,
        type: "RISK",
        title: risk.riskTitle,
        subtitle: risk.riskLevel,
        status: risk.status,
        icon: "security",

        searchText: [
          risk.riskTitle,
          risk.riskLevel,
          risk.status,
          risk.hazard?.asset?.assetName,
        ]
          .filter(Boolean)
          .join(" ")
          .toLowerCase(),

        object: risk,
      })),

      // ============================
      // INCIDENTS
      // ============================

      ...incidents.map((incident) => ({
        id: incident.incidentId,
        type: "INCIDENT",
        title: incident.incidentTitle,
        subtitle: incident.asset?.assetName ?? "No Asset",
        status: incident.status,
        icon: "warning",

        searchText: [
          incident.incidentTitle,
          incident.status,
          incident.asset?.assetName,
          incident.risk?.riskTitle,
        ]
          .filter(Boolean)
          .join(" ")
          .toLowerCase(),

        object: incident,
      })),
    ];

    return resp.status(200).json({
      success: true,
      message: "Search data fetched successfully.",
      total: searchResults.length,
      data: searchResults,
    });
  } catch (error) {
    console.error("Error fetching search data:", error);

    return resp.status(500).json({
      success: false,
      message: "Internal server error.",
    });
  }
};