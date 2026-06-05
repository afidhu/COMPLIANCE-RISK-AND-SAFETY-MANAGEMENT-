import { Router } from "express";
import { addRisks } from "../controllers/risks_controllers/add_risks.js";


const router = Router();

router.get('risk/',addRisks)

export default router;