
import type { Request, Response } from "express";
import { prisma } from "../../index.ts";

// add a new incident
export const addIncident = async (req: Request, resp: Response) => {
    try {
        const { assetId, riskId, incidentTitle, description, incidentDate, reportedById } = req.body;
        const newIncident = await prisma.incident.create({
            data: {
                assetId,
                riskId,
                incidentTitle,
                description,
                incidentDate,
                reportedById,

            }
        });
        return resp.status(201).json(newIncident);
    } catch (error) {
        console.error("Error adding incident:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all incidents
export const getIncidents = async (req: Request, resp: Response) => {
    try {
        const incidents = await prisma.incident.findMany({
            include: {
                asset: true,
                risk: true,
                reportedBy: true
            },
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(incidents);
    } catch (error) {
        console.error("Error fetching incidents:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get an incident by ID
export const getIncidentById = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        const incident = await prisma.incident.findUnique({
            where: { incidentId: `${id}` }
        });
        if (!incident) {
            return resp.status(404).json({ message: "Incident not found" });
        }
        return resp.status(200).json(incident);
    } catch (error) {
        console.error("Error fetching incident by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get incidents by asset ID
export const getIncidentsByAssetId = async (req: Request, resp: Response) => {
    try {
        const { assetId } = req.params;
        const incidents = await prisma.incident.findMany({
            where: { assetId: `${assetId}` },
            orderBy: {
                createdAt: "desc",
            }
        });
        return resp.status(200).json(incidents);
    } catch (error) {
        console.error("Error fetching incidents by asset ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get incidents by risk ID
export const getIncidentsByRiskId = async (req: Request, resp: Response) => {
    try {
        const { riskId } = req.params;
        const incidents = await prisma.incident.findMany({
            where: { riskId: `${riskId}` },
            orderBy: {
                createdAt: "desc",
            }
        });
        return resp.status(200).json(incidents);
    } catch (error) {
        console.error("Error fetching incidents by risk ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// update an incident
export const updateIncident = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        const { assetId, riskId, incidentTitle, description, incidentDate } = req.body;
        const updatedIncident = await prisma.incident.update({
            where: { incidentId: `${id}` },
            data: {
                assetId,
                riskId,
                incidentTitle,
                description,
                incidentDate
            }
        });
        return resp.status(200).json(updatedIncident);
    } catch (error) {
        console.error("Error updating incident:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// delete an incident
export const deleteIncident = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        await prisma.incident.delete({
            where: { incidentId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting incident:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get an incident by ID
export const getIncidentByIdWithDetails = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        const incident = await prisma.incident.findUnique({
            where: { incidentId: `${id}` },
            include: {
                asset: true,
                risk: true,
                reportedBy: true
            }
        });
        if (!incident) {
            return resp.status(404).json({ message: "Incident not found" });
        }
        return resp.status(200).json(incident);
    } catch (error) {
        console.error("Error fetching incident with details by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get incidents by asset ID with details
export const getIncidentsByAssetIdWithDetails = async (req: Request, resp: Response) => {
    try {
        const { assetId } = req.params;
        const incidents = await prisma.incident.findMany({
            where: { assetId: `${assetId}` },
            include: {
                asset: true,
                risk: true,
                reportedBy: true
            },
            orderBy: {
                createdAt: "desc",
            }
        });
        return resp.status(200).json(incidents);
    } catch (error) {
        console.error("Error fetching incidents with details by asset ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}