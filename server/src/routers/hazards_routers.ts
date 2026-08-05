import { Router } from "express";
import { addHazard, deleteHazard, getHazardById, getHazards, getHazardsByReportedById, updateHazard, } from "../controllers/hazards_controllers/crud_hazard";



const router = Router();

router.post('/add',addHazard)
router.get('/get',getHazards)
router.get('/get-by-reportedby/:reportedById', getHazardsByReportedById)
router.put('/update/:id',updateHazard)
router.delete('/delete/:id',deleteHazard)
router.get('/get/:id',getHazardById)


export default router;