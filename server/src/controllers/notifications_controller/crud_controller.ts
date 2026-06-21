

import type { Request, Response } from "express";
import { prisma } from "../../index.ts";

// Create a new notification
export const createNotification = async (sender_id:any, receiver_id:any, title:any, content:any, notify_type:any, reference_id:any) => {
    try {
        // const { sender_id, receiver_id, title, content, notify_type, reference_id } = req.body;

        if (!sender_id || !receiver_id) {
            console.log('receiver_id required')
            return 'receiver_id required '
            // return resp.status(400).json({ message: "sender_id and receiver_id are required" });
        }

        const newNotification = await prisma.notification.create({
            data: {
                sender_id,
                receiver_id,
                title,
                content,
                notify_type,
                reference_id,
            },
            include: {
                sender: true,
                receiver: true
            }
        });
console.log('newNotification:',newNotification);
        return newNotification;

        
        // return resp.status(201).json(newNotification);
    } catch (error) {
        console.error("Error creating notification:", error);
        // return resp.status(500).json({ message: "Internal server error" });
    }
};


// Get all notifications in the system
export const getAllNotifications = async (req: Request, resp: Response) => {
    try {
        const notifications = await prisma.notification.findMany({
            orderBy: { 
                createdAt: "desc" // Newest notifications first
            },
            include: {
                sender: true,   // Includes sender User profile details
                receiver: true  // Includes receiver User profile details
            }
        });

        return resp.status(200).json(notifications);
    } catch (error) {
        console.error("Error fetching all notifications:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};


// Get a single notification by ID
export const getNotificationById = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;

        const notification = await prisma.notification.findUnique({
            where: { notify_id: `${id}` },
            include: {
                sender: true,
                receiver: true
            }
        });

        if (!notification) {
            return resp.status(404).json({ message: "Notification not found" });
        }

        return resp.status(200).json(notification);
    } catch (error) {
        console.error("Error fetching notification:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};

// Get all notifications for a specific receiver (User Inbox)
export const getNotificationsByReceiver = async (req: Request, resp: Response) => {
    try {
        const { userId } = req.params;

        const notifications = await prisma.notification.findMany({
            where: { receiver_id: `${userId}` },
            orderBy: { createdAt: "desc" }
        });

        return resp.status(200).json(notifications);
    } catch (error) {
        console.error("Error fetching user notifications:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};

// Update a notification (e.g., Mark as read)
export const updateNotification = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;
        const { is_read, title, content } = req.body;

        const updatedNotification = await prisma.notification.update({
            where: { notify_id: `${id}` },
            data: {
                is_read,
                title,
                content
            }
        });

        return resp.status(200).json(updatedNotification);
    } catch (error) {
        console.error("Error updating notification:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};

// Delete a notification
export const deleteNotification = async (req: Request, resp: Response) => {
    try {
        const { id } = req.params;

        await prisma.notification.delete({
            where: { notify_id: `${id}` }
        });

        return resp.status(200).json({ message: "Notification deleted successfully" });
    } catch (error) {
        console.error("Error deleting notification:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};

// Get all unread notifications for a specific receiver
export const getUnreadNotificationsByReceiver = async (req: Request, resp: Response) => {
    try {
        const { userId } = req.params;

        if (!userId) {
            return resp.status(400).json({ message: "userId parameter is required" });
        }

        const unreadNotifications = await prisma.notification.findMany({
            where: { 
                receiver_id: `${userId}`,
                is_read: false // Only fetch items where is_read is false
            },
            orderBy: { 
                createdAt: "desc" // Newest unread notifications first
            }
        });

        return resp.status(200).json(unreadNotifications);
    } catch (error) {
        console.error("Error fetching unread notifications:", error);
        return resp.status(500).json({ message: "Internal server error" });
    }
};
