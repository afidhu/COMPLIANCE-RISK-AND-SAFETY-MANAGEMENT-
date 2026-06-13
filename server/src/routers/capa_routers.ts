import { Router } from "express";
import { addCapa, getCapaById, getCapas, getCapasByHazardId, getCapasByRiskId, getCapasByTechnicianId, updateCapa } from "../controllers/capa_controller/crup_controller.ts";
import { deleteAsset } from "../controllers/assets_controllers/crud_assets.ts";




const router = Router();

router.post('/add',addCapa)
router.get('/get',getCapas)
router.get('/get/:capaId',getCapaById)
router.put('/update/:capaId',updateCapa)
router.get('/get-by-riskid/:riskid',getCapasByRiskId )
router.get('/get-by-hazardid/:hazardId',getCapasByHazardId)
router.get('/get-by-userid/:userId',getCapasByTechnicianId)
router.delete('/delete/:id',deleteAsset)
router.put('/update/:id',addCapa)

export default router;