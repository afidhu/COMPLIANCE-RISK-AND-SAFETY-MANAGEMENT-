import type { Request,Response } from "express";
import { prisma } from "../../index.ts";


// Controller function to add a new risk
export const addRisks = async(req:Request, resp:Response)=>{
    try {
        const { hazardId, riskTitle, riskDescription } = req.body;
        const newRisk = await prisma.risk.create({
            data: {
                hazardId,
                riskTitle,
                riskDescription
            }
        });
     
        return resp.status(201).json(newRisk);
    } catch (error) {
        console.error("Error adding risk:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get all risks
export const getRisks = async(req:Request, resp:Response)=>{
    try {
        const risks = await prisma.risk.findMany();
        return resp.status(200).json(risks);
    } catch (error) {
        console.error("Error fetching risks:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get a risk by ID
export const getRiskById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const risk = await prisma.risk.findUnique({
            where: { riskId: `${id}` }
        });
        if (!risk) {
            return resp.status(404).json({ message: "Risk not found" });
        }
        return resp.status(200).json(risk);
    } catch (error) {
        console.error("Error fetching risk by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to update a risk
export const updateRisk = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { hazardId, riskTitle, riskDescription, likelihood, impact, riskRating } = req.body;
        const updatedRisk = await prisma.risk.update({
            where: { riskId: `${id}` },
            data: {
                hazardId,
                riskTitle,
                riskDescription,
                likelihood,
                impact,
                riskRating
            }
        });
        return resp.status(200).json(updatedRisk);
    } catch (error) {
        console.error("Error updating risk:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to delete a risk
export const deleteRisk = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.risk.delete({
            where: { riskId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting risk:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get risks by hazard ID
export const getRisksByHazardId = async(req:Request, resp:Response)=>{
    try {
        const { hazardId } = req.params;
        console.log("Fetching risks for hazard ID:", hazardId);
        const risks = await prisma.risk.findMany({
            where: { 
                hazardId: `${hazardId}`
             },
       
        });
        return resp.status(200).json(risks);
    } catch (error) {
        console.error("Error fetching risks by hazard ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}