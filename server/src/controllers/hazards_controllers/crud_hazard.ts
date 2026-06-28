import type { Request, Response } from "express";
import { prisma } from "../../index.ts";


// Controller function to add a new hazard
export const addHazard = async(req:Request, resp:Response)=>{
    try {   
        const { assetId, complianceId, hazardTitle, hazardDescription, status, reportedById } = req.body;   
        const newHazard = await prisma.hazard.create({
            data: {
                assetId,
                complianceId,
                hazardTitle,
                hazardDescription,
                status,
                reportedById
            }
        })
        console.log(newHazard);
    
        return resp.status(201).json(newHazard);
    } catch (error: any) {
        console.error("Error adding hazard:", error.message);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get all hazards
export const getHazards = async(req:Request, resp:Response)=>{
    try {
        const hazards = await prisma.hazard.findMany({
            include: {
                reportedBy:true,
                asset:true
            }
            ,
              orderBy: {
    createdAt: "desc",
              }
        });
        return resp.status(200).json(hazards);
    } catch (error) {
        console.error("Error fetching hazards:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get a hazard by ID
export const getHazardById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const hazard = await prisma.hazard.findUnique({
            where: { hazardId: `${id}` }
        });
        if (!hazard) {
            return resp.status(404).json({ message: "Hazard not found" });
        }
        return resp.status(200).json(hazard);
    } catch (error) {
        console.error("Error fetching hazard by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to update a hazard
export const updateHazard = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { assetId, complianceId, hazardTitle, hazardDescription, status } = req.body;
        const updatedHazard = await prisma.hazard.update({
            where: { hazardId: `${id}` },
            data: {
                assetId,
                complianceId,
                hazardTitle,
                hazardDescription,
                status
            }
        });
        return resp.status(200).json(updatedHazard);
    } catch (error) {
        console.error("Error updating hazard:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get hazards by reported user ID
export const getHazardsByReportedById = async(req:Request, resp:Response)=>{
    try {
        const { reportedById } = req.params;
        const hazards = await prisma.hazard.findMany({
            where: { reportedById: `${reportedById}` },
            include: {
                reportedBy: true,
                asset: true
            },
            orderBy: {
                createdAt: "desc",
                    status: "desc"
            }
        });
        return resp.status(200).json(hazards);
    } catch (error) {
        console.error("Error fetching hazards by reportedBy ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to delete a hazard
export const deleteHazard = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.hazard.delete({
            where: {
                hazardId: `${id}`
            }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting hazard:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}   


// get 