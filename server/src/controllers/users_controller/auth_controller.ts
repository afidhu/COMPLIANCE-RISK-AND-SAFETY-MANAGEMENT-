import type { Request,Response } from "express";
import { prisma } from "../../index.ts";




// register a new user
export const registerUser = async(req:Request, resp:Response)=>{
    try {
        const { fullName, email, role, phone } = req.body;
       const newUser = await prisma.user.create({
        data: {
            fullName,
            email,
            role,
            phone
        }
       });
       console.log(newUser)
       return resp.status(201).json(newUser);
    } catch (error) {
        console.error("Error registering user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// login a user
export const loginUser = async(req:Request, resp:Response)=>{
    try {
        const { email } = req.body;
        const user = await prisma.user.findUnique({
            where: { email: `${email}` }
        });
         console.log(user)
        if (!user) {
            return resp.status(404).json({ message: "User not found" });
        }
        console.log(user)
        return resp.status(200).json(user);
    } catch (error) {
        console.error("Error logging in user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}


// get all users
export const getUsers = async(req:Request, resp:Response)=>{
    try {
        const users = await prisma.user.findMany();
        return resp.status(200).json(users);
    } catch (error) {
        console.error("Error fetching users:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

//get all technician

export const getTechnician = async(req:Request, resp:Response)=>{
    try {
        const users = await prisma.user.findMany({
            where:{
                role:{
                    equals:'TECHNICIAN'
                }
            }
        });
        return resp.status(200).json(users);
    } catch (error) {
        console.error("Error fetching users:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get a user by ID
export const getUserById = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const user = await prisma.user.findUnique({
            where: { userId: `${id}` }
        });
        if (!user) {
            return resp.status(404).json({ message: "User not found" });
        }
        return resp.status(200).json(user);
    } catch (error) {
        console.error("Error fetching user by ID:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// update a user
export const updateUser = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const { fullName, email, role, phone } = req.body;
        const updatedUser = await prisma.user.update({
            where: { userId: `${id}` },
            data: {
                fullName,
                email,
                role,
                phone
            }
        });
        return resp.status(200).json(updatedUser);
    } catch (error) {
        console.error("Error updating user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// delete a user
export const deleteUser = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        await prisma.user.delete({
            where: { userId: `${id}` }
        });
        return resp.status(204).send();
    } catch (error) {
        console.error("Error deleting user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get a user by email
export const getUserByEmail = async(req:Request, resp:Response)=>{
    try {
        const { email } = req.params;
        const user = await prisma.user.findUnique({
            where: { email: `${email}` }
        });
        if (!user) {
            return resp.status(404).json({ message: "User not found" });
        }
        return resp.status(200).json(user);
    } catch (error) {
        console.error("Error fetching user by email:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}