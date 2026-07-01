import type { Request, Response } from "express";
import { prisma } from "../../index.ts";
import { automaticNotification } from "../notifications_controller/auto_notification_capa.ts";
import { createNotification } from "../notifications_controller/crud_controller.ts";

import { NotificationType } from "@prisma/client";

// export interface NotificationData {
//   sender_id: string;
//   receiver_id: string;
//   title: string;
//   content: string;
//   notify_type: NotificationType; // Uses your Prisma enum (e.g., 'LIKE', 'COMMENT', 'CAPA')
//   reference_id?: string | null;   // Optional field matching your Prisma schema
// }

// add a new CAPA action
export const addCapa = async (req: Request, resp: Response) => {


    try {
        const { actionTitle, assignedToId, dueDate, hazardId, playerId, sender_id } = req.body;
        if (playerId == null || sender_id == null) {
            return resp.status(400).json('playerId & sender_id required')
        }
        const newCapa = await prisma.capaAction.create({
            data: {

                actionTitle: actionTitle,
                assignedToId: assignedToId,
                dueDate: dueDate,
                hazardId: hazardId,
            },
            include: {
                assignedTo: true
            }
        });
        if (newCapa.capaId.length > 0) {
            const notificate = automaticNotification('Task assigned', `${newCapa.actionTitle}`, `${playerId}`, 'CAPA', `${newCapa.capaId}`)
            notificate.then((data) => {
                console.log('createNotification:', data)
                createNotification(`${sender_id}`, `${newCapa.assignedTo.userId}`, `Task assigned`, `${newCapa.actionTitle}`, `CAPA`, `${newCapa.capaId}`)
            })
        }
        console.log(newCapa)
        return resp.status(201).json(newCapa);
    } catch (error) {
        console.error("Error adding CAPA:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all CAPA actions
export const getCapas = async (req: Request, resp: Response) => {
    try {
        const capas = await prisma.capaAction.findMany({
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get a CAPA action by ID
export const getCapaById = async (req: Request, resp: Response) => {
    try {
        const { capaId } = req.params;
        const capa = await prisma.capaAction.findUnique({
            where: {
                capaId: `${capaId}`
            }

        });
        if (!capa) {
            return resp.status(404).json({ message: "CAPA action not found" });
        }
        return resp.status(200).json(capa);
    } catch (error) {
        console.error("Error fetching CAPA action by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get CAPA actions by risk ID    
export const getCapasByRiskId = async (req: Request, resp: Response) => {
    try {
        const { riskid } = req.params;
        const capas = await prisma.capaAction.findMany({
            where: { riskId: `${riskid}` }, orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions by risk ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// update a CAPA action
export const updateCapa = async (req: Request, resp: Response) => {
    try {
        const { capaId } = req.params;
        const { riskId, actionTitle, assignedToId, dueDate, status } = req.body;
        const updatedCapa = await prisma.capaAction.update({
            where: { capaId: `${capaId}` },
            data: {
                status: status,
            }
        });
        console.log(updatedCapa)
        return resp.status(200).json(updatedCapa);
    } catch (error) {
        console.error("Error updating CAPA action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// delete a CAPA action
export const deleteCapa = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        await prisma.capaAction.delete({
            where: { capaId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting CAPA action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}


// get CAPA actions by hazard ID    
export const getCapasByHazardId = async (req: Request, resp: Response) => {
    try {
        const { hazardId } = req.params;
        const capas = await prisma.capaAction.findMany({
            where: {
                hazard: {
                    hazardId: `${hazardId}`
                }
            },
            include: {
                assignedTo: true,
                hazard: {
                    include: {
                        asset: true
                    }
                }
            },
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions by hazard ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}


// get CAPA By Technician ID    
export const getCapasByTechnicianId = async (req: Request, resp: Response) => {
    try {
        const { userId } = req.params;
        const capas = await prisma.capaAction.findMany({
            where: {
                assignedToId: `${userId}`
            },
            include: {
                assignedTo: true,
                hazard: {
                    include: {
                        asset: true
                    }
                }

            },
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions by hazard ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}


// update CAPA ation as approved 
export const approveCapasByEstateMenager = async (req: Request, resp: Response) => {
    const { capaId } = req.params;
    try {
        const capa = await prisma.capaAction.findUnique({
            where: {
                capaId: `${capaId}`
            }
        });

        if (!capa) {
            return resp.status(404).json({ message: "CAPA action not found" });
        }

        let updatedCapa;

        if (capa.isApproved === false) {
            updatedCapa = await prisma.capaAction.update({
                where: {
                    capaId: `${capaId}`
                },
                data: {
                    isApproved: true
                }
            });
            console.log('capa approved', updatedCapa);

            if (capa.hazardId) {
                await prisma.hazard.update({
                    where: {
                        hazardId: capa.hazardId
                    },
                    data: {
                        status: "CLOSED"
                    }
                });
            }
        } else if (capa.isApproved === true) {
            updatedCapa = await prisma.capaAction.update({
                where: {
                    capaId: `${capaId}`
                },
                data: {
                    isApproved: false
                }
            });
            console.log('capa unapproved', updatedCapa);

            if (capa.hazardId) {
                await prisma.hazard.update({
                    where: {
                        hazardId: capa.hazardId
                    },
                    data: {
                        status: 'OPEN'
                    }
                });
            }
        }

        return resp.status(200).json(updatedCapa ?? capa);
    } catch (error) {
        console.error("Error approving CAPA action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all capa where status is completed and isApproved false
export const getCompletedUnapprovedCapas = async (req: Request, resp: Response) => {
    try {
        const capas = await prisma.capaAction.findMany({
            where: {
                status: "COMPLETED",
                isApproved: false,
            },
            include: {
                assignedTo: true,
                hazard: {
                    include: {
                        asset: true,
                    },
                },
            },
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching completed unapproved CAPA actions:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};


// get all capa where status is completed and isApproved true by technician ID
export const getCompletedApprovedCapasByTechnicianId = async (req: Request, resp: Response) => {
    try {
        const { userId } = req.params;
        const capas = await prisma.capaAction.findMany({
            where: {
                status: "COMPLETED",
                isApproved: true,
                assignedToId: `${userId}`
            },
            include: {
                assignedTo: true,
                hazard: {
                    include: {
                        asset: true,
                    },
                },
            },
            orderBy: {
                createdAt: "desc",
            },
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching completed approved CAPA actions by technician ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};