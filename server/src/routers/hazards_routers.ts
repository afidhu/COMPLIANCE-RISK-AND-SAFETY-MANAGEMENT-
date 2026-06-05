import { Router } from "express";
import { addHazard } from "../controllers/hazards_controllers/add_hazard.ts";



const router = Router();

router.get('/',addHazard)

export default router;