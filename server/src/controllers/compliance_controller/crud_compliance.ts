
import type { Request,Response } from "express";
import { prisma } from "../../index";


// Controller function to add a new compliance
export const addCompliance = async(req:Request, resp:Response)=>{
    try {
        const { complianceName, assetId, frequency, lastDueDate, dueDate, expireDate, status } = req.body;
        const newCompliance = await prisma.compliance.create({
            data: {
                complianceName,
                assetId,
                frequency,
                lastDueDate: lastDueDate ? new Date(lastDueDate) : null, 
                dueDate: new Date(dueDate),
                expireDate: expireDate ? new Date(expireDate) : null,
                status: status || 'COMPLIANT', // Default to 'COMPLIANT' if not provided
            }
        });
        console.log(newCompliance)
        return resp.status(201).json(newCompliance);
    } catch (error) {
        console.error("Error adding compliance:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get all compliances
export const getCompliances = async(req:Request, resp:Response)=>{
    try {
        const compliances = await prisma.compliance.findMany({
                include: { asset: true }, orderBy: {
    createdAt: "desc",
  },
        });
        return resp.status(200).json(compliances);
    } catch (error) {
        console.error("Error fetching compliances:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get a compliance by ID
export const getComplianceById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const compliance = await prisma.compliance.findUnique({
            where: { complianceId: `${id}` }
        });
        if (!compliance) {
            return resp.status(404).json({ message: "Compliance not found" });
        }
        return resp.status(200).json(compliance);
    } catch (error) {
        console.error("Error fetching compliance by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to update a compliance
export const updateCompliance = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { complianceName, frequency, lastDueDate, dueDate, expireDate, status } = req.body;
        const updatedCompliance = await prisma.compliance.update({
            where: { complianceId: `${id}` },
            data: {
                complianceName,
                frequency,
                status: status || 'COMPLIANT',
                lastDueDate: lastDueDate ? new Date(lastDueDate) : null,
                dueDate: new Date(dueDate),
                expireDate: expireDate ? new Date(expireDate) : null,
            }
        });
        console.log(updatedCompliance)
        return resp.status(200).json(updatedCompliance);
    } catch (error) {
        console.error("Error updating compliance:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to delete a compliance
export const deleteCompliance = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.compliance.delete({
            where: { complianceId: `${id}` }
        });
        return resp.status(200).json({ message: "Compliance deleted successfully" });
    } catch (error) {
        console.error("Error deleting compliance:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}   

// get all compliance by asset ID
export const getCompliancesByAssetId = async(req:Request, resp:Response)=>{
    try {
        const { assetid } = req.params;
        const compliances = await prisma.compliance.findMany({
            where: { 
                asset: {
                    assetId: `${assetid}`
                }
             },
              orderBy: {
    createdAt: "desc",
              }
        });
        return resp.status(200).json(compliances);
    } catch (error) {
        console.error("Error fetching compliances by asset ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}