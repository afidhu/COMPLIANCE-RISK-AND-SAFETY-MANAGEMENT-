import { Router } from "express";
import { technicianNotification } from "../controllers/notifications_controller/technician_notif_controller";
import {
    createNotification,
    getNotificationById,
    getNotificationsByReceiver,
    updateNotification,
    deleteNotification,
    getUnreadNotificationsByReceiver,
    getAllNotifications
} from "../controllers/notifications_controller/crud_controller";

const router = Router();

router.post('/send-capa',technicianNotification)
router.get("/", getAllNotifications);
router.get("/:id", getNotificationById);
router.get("/user/:userId", getNotificationsByReceiver);
router.patch("/:id", updateNotification);
router.delete("/:id", deleteNotification);
router.get("/unread/user/:userId", getUnreadNotificationsByReceiver);


export default router;
