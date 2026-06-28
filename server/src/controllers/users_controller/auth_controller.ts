import type { Request,Response } from "express";
import { prisma } from "../../index.ts";


// register a new user
export const registerUser = async (req: Request, resp: Response) => {
    try {
        const { fullName, email, role, phone, playerId, password } = req.body;
        
        const datBody = {
            fullName,
            email,
            role,
            phone,
            playerId: playerId || null, // Stores as null in DB if missing
            password,
        };

        let user;

        // If the user has a playerId (Mobile App Users)
        if (playerId) {
            user = await prisma.user.upsert({
                where: {
                    email: email,
                },
                update: datBody, // Updates the existing user with this device ID
                create: datBody, // Creates a new user if device ID is new
            });
        } else {
            // If playerId is missing (Web Users)
            user = await prisma.user.create({
                data: datBody,
            });
        }

        console.log(user);
        return resp.status(201).json(user);
    } catch (error: any) {
        console.error("Error registering user:", error);

        // Optional: Catch accidental duplicate email crashes
        if (error.code === 'P2002') {
            return resp.status(400).json({ message: "User registration conflict." });
        }

        return resp.status(500).json({ message: "Internal server error" });
    }
};

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

// count all users based on their role
export const countUsersByRole = async(req:Request, resp:Response)=>{
    try {
        const usersByRole = await prisma.user.groupBy({
            by: ['role'],
            _count: {
                userId: true
            }
        });
        
        const result = usersByRole.map(item => ({
            role: item.role,
            count: item._count.userId
        }));
        
        return resp.status(200).json(result);
    } catch (error) {
        console.error("Error counting users by role:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// get all user based on role

export const allUserBasedOnRole = async(req:Request, resp:Response)=>{
    try {
        const { role } = req.params;
        if (!role) {
            return resp.status(400).json({ message: "Role parameter is required" });
        }

        const users = await prisma.user.findMany({
            where: {
                role: {
                    equals: role.toUpperCase(),
                }
            }
        });

        return resp.status(200).json(users);
    } catch (error) {
        console.error("Error getting users by role:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Deactivate user
export const deactivateUser = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const user = await prisma.user.update({
            where: { userId: `${id}` },
            data: { status: 'INACTIVE' }
        });

        return resp.status(200).json(user);
    } catch (error) {
        console.error("Error deactivating user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Activate and deactivate user
export const activateUserDeactivate = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const getUser = await   prisma.user.findFirst({
            where:{
                userId:`${id}`
            }
        })

        if(getUser?.status === 'ACTIVE'){
           await prisma.user.update({
            where: { userId: `${id}` },
            data: { status: 'INACTIVE' }
        });

        }
        else{
             await prisma.user.update({
            where: { userId: `${id}` },
            data: { status: 'ACTIVE' }
        });
        }


        return resp.status(200).json(getUser);
    } catch (error) {
        console.error("Error activating user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}

// Approve user
export const approveUser = async(req:Request, resp:Response)=>{
    try {
        const { id } = req.params;
        const getUser = await   prisma.user.findFirst({
            where:{
                userId:`${id}`
            }
        })
        if(getUser?.isApproved ===true){
         await prisma.user.update({
                    where: { userId: `${id}` },
                    data:{isApproved:false}
                });
                
        }
       else if(getUser?.isApproved ===false){
        await prisma.user.update({
            where: { userId: `${id}` },
            data:{isApproved:true}
        });

       }
       console.log('Approved:',getUser)
        
        return resp.status(200).json(getUser);
    } catch (error) {
        console.error("Error approving user:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
}