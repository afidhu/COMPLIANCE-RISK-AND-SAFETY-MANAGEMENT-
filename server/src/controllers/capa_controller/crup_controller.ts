import type { Request,Response } from "express";
import { prisma } from "../../index.ts";


// add a new CAPA action
export const addCapa = async(req:Request, resp:Response)=>{
    try {
        const { riskId, actionTitle, assignedToId, dueDate } = req.body;
        const newCapa = await prisma.capaAction.create({
            data: {
                riskId,
                actionTitle,
                assignedToId,
                dueDate
            }
        });
        return resp.status(201).json(newCapa);
    } catch (error) {
        console.error("Error adding CAPA:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all CAPA actions
export const getCapas = async(req:Request, resp:Response)=>{
    try {
        const capas = await prisma.capaAction.findMany();
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get a CAPA action by ID
export const getCapaById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const capa = await prisma.capaAction.findUnique({
            where: { 
                capaId: `${id}`
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
export const getCapasByRiskId = async(req:Request, resp:Response)=>{
    try {
        const { riskId } = req.params;
        const capas = await prisma.capaAction.findMany({
            where: { riskId: `${riskId}` }
        });
        return resp.status(200).json(capas);
    } catch (error) {
        console.error("Error fetching CAPA actions by risk ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// update a CAPA action
export const updateCapa = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { riskId, actionTitle, assignedToId, dueDate, status } = req.body;
        const updatedCapa = await prisma.capaAction.update({
            where: { capaId: `${id}` },
            data: {
                riskId,
                actionTitle,
                assignedToId,
                dueDate,
                status
            }
        });
        return resp.status(200).json(updatedCapa);
    } catch (error) {
        console.error("Error updating CAPA action:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// delete a CAPA action
export const deleteCapa = async(req:Request, resp:Response)=>{
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