import { Router } from "express";
import { addCompliance, deleteCompliance, getComplianceById, getCompliances, getCompliancesByAssetId, updateCompliance } from "../controllers/compliance_controller/crud_compliance";




const router = Router();

router.post('/add',addCompliance)
router.get('/get',getCompliances)
router.get('/get/:id',getComplianceById)
router.get('/get-by-assetid/:assetid',getCompliancesByAssetId) // This can be implemented in the controller to filter by assetId
router.put('/update/:id',updateCompliance)
router.delete('/delete/:id',deleteCompliance)

export default router;