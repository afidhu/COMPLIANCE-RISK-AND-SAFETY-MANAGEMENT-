import { Router } from "express";
import { addHazard, deleteHazard, getHazardById, getHazards, updateHazard, } from "../controllers/hazards_controllers/crud_hazard.ts";



const router = Router();

router.post('/add',addHazard)
router.get('/get',getHazards)
router.put('/update/:id',updateHazard)
router.delete('/delete/:id',deleteHazard)
router.get('/get/:id',getHazardById)


export default router;