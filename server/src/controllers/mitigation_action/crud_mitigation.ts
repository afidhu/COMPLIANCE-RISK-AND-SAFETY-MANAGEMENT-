import type { Request,Response } from "express";
import { prisma } from "../../index.ts";




// add a new mitigation action
export const addMitigationAction = async(req:Request, resp:Response)=>{
    try {
        const { riskId, actionTitle, assignedToId, targetDate } = req.body;
       const newMitigationAction = await prisma.mitigationAction.create({
           data: {
               riskId,
               actionTitle,
               assignedToId,
               targetDate
           }
       });
       return resp.status(201).json(newMitigationAction);
    } catch (error) {
        console.error("Error adding mitigation action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all mitigation actions
export const getMitigationActions = async(req:Request, resp:Response)=>{
    try {
        const mitigationActions = await prisma.mitigationAction.findMany();
        return resp.status(200).json(mitigationActions);
    } catch (error) {
        console.error("Error fetching mitigation actions:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get a mitigation action by ID
export const getMitigationActionById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const mitigationAction = await prisma.mitigationAction.findUnique({
            where: { 
                mitigationId: `${id}`
            }
        });
        if (!mitigationAction) {
            return resp.status(404).json({ message: "Mitigation action not found" });
        }
        return resp.status(200).json(mitigationAction);
    } catch (error) {
        console.error("Error fetching mitigation action by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get mitigation actions by risk ID    
export const getMitigationActionsByRiskId = async(req:Request, resp:Response)=>{
    try {
        const { riskId } = req.params;
        const mitigationActions = await prisma.mitigationAction.findMany({
            where: { riskId: `${riskId}` }
        });
        return resp.status(200).json(mitigationActions);
    } catch (error) {
        console.error("Error fetching mitigation action by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// update a mitigation action
export const updateMitigationAction = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { riskId, actionTitle, assignedToId, targetDate, status } = req.body;
        const updatedMitigationAction = await prisma.mitigationAction.update({
            where: { 
                mitigationId: `${id}`
             },
            data: {
                riskId,
                actionTitle,
                assignedToId,
                targetDate,
                status
            }
        });
        return resp.status(200).json(updatedMitigationAction);
    } catch (error) {
        console.error("Error updating mitigation action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// delete a mitigation action
export const deleteMitigationAction = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.mitigationAction.delete({
            where: { mitigationId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting mitigation action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}