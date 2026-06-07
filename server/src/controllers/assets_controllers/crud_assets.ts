import type { Request, Response } from "express";
import { prisma } from "../../index.ts";

export const addAsset = async(req:Request, resp:Response)=>{
    try {
        const { assetName, location, assetType, createdById } = req.body;
       const newAsset = await prisma.asset.create({ 
        data: {
            assetName,
            location,
            assetType,
            createdById,
        }
       })
       return resp.status(201).json(newAsset);
    } catch (error) {
        console.error("Error adding asset:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get all assets
export const getAssets = async(req:Request, resp:Response)=>{
    try {
        const assets = await prisma.asset.findMany();
        return resp.status(200).json(assets);
    } catch (error) {
        console.error("Error fetching assets:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to get an asset by ID
export const getAssetById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const asset = await prisma.asset.findUnique({
            where: { assetId: `${id}` }
        });
        if (!asset) {
            return resp.status(404).json({ message: "Asset not found" });
        }
        return resp.status(200).json(asset);
    } catch (error) {
        console.error("Error fetching asset by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to update an asset
export const updateAsset = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { assetName, location, status } = req.body;
        const updatedAsset = await prisma.asset.update({
            where: { assetId: `${id}` },
            data: {
                assetName,
                location,
                status
            }
        });
        return resp.status(200).json(updatedAsset);
    } catch (error) {
        console.error("Error updating asset:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Controller function to delete an asset
export const deleteAsset = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.asset.delete({
            where: { assetId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting asset:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}