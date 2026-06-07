import { Router } from "express";
import { addCompliance, deleteCompliance, getComplianceById, getCompliances, updateCompliance } from "../controllers/compliance_controller/crud_compliance.ts";




const router = Router();

router.post('/add',addCompliance)
router.get('/get',getCompliances)
router.get('/get/:id',getComplianceById)
router.put('/update/:id',updateCompliance)
router.delete('/delete/:id',deleteCompliance)

export default router;