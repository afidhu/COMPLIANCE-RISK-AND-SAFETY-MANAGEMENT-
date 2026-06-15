import { Router } from "express";
import { getTechnician, getUsers, loginUser, registerUser } from "../controllers/users_controller/auth_controller.ts";




const router = Router();

router.post('/login',loginUser)
router.post('/register',registerUser)
router.get('/users',getUsers)
router.get('/users/technician',getTechnician)


export default router;