import type { Request, Response } from "express";


export const addHazard = async(req:Request, resp:Response)=>{

    resp.status(200).json({message: 'hazard added'})
}