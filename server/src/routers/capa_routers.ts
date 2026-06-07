import { Router } from "express";
import { addCapa, getCapaById, getCapas } from "../controllers/capa_controller/crup_controller.ts";




const router = Router();

router.post('/add',addCapa)
router.get('/get',getCapas)
router.get('/get/:id',getCapaById)
router.put('/update/:id',addCapa)

export default router;