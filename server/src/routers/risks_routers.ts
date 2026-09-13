import { Router } from "express";
import { addRisks, deleteRisk, getRiskById, getRisks, getRisksByHazardId, updateRisk } from "../controllers/risks_controllers/crud_risks";




const router = Router();

router.post('/add',addRisks)
router.get('/get',getRisks)
router.get('/get/:id',getRiskById)
router.put('/update/:id',updateRisk)
router.delete('/delete/:id',deleteRisk)
router.get('/get-by-hazard/:hazardId',getRisksByHazardId)

export default router;