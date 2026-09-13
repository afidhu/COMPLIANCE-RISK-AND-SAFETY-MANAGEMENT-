import { Router } from "express";
import { activateUserDeactivate, allUserBasedOnRole, approveUser, countUsersByRole, deactivateUser, getTechnician, getUsers, loginUser, registerUser } from "../controllers/users_controller/auth_controller";




const router = Router();

router.post('/login',loginUser)
router.post('/register',registerUser)
router.get('/users',getUsers) 
router.get('/users/countUsersByRole',countUsersByRole) 
router.get('/users/role/:role',allUserBasedOnRole) 
router.get('/users/technician',getTechnician)
router.patch('/users/deactivate/:id', deactivateUser)
router.patch('/users/activateUser-deactivate/:id', activateUserDeactivate)
router.patch('/users/approve/:id', approveUser)


export default router;