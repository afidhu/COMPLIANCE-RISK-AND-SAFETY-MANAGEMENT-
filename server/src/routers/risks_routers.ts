import { Router } from "express";
import { addRisks, deleteRisk, getRiskById, getRisks, updateRisk } from "../controllers/risks_controllers/crud_risks.ts";




const router = Router();

router.post('/add',addRisks)
router.get('/get',getRisks)
router.get('/get/:id',getRiskById)
router.put('/update/:id',updateRisk)
router.delete('/delete/:id',deleteRisk)

export default router;