import { Router } from "express";
import { addCapa, approveCapasByEstateMenager, getCapaById, getCapas, getCapasByHazardId, getCapasByRiskId, getCapasByTechnicianId, updateCapa, deleteCapa, getCompletedUnapprovedCapas, getCompletedApprovedCapasByTechnicianId } from "../controllers/capa_controller/crup_controller";
import { uploadSingle } from "../middlewares/file.upload";




const router = Router();

router.post('/add',addCapa)
router.get('/get',getCapas)
router.get('/get/:capaId',getCapaById)
router.put('/update/:capaId',uploadSingle, updateCapa)
router.get('/get-by-riskid/:riskid',getCapasByRiskId )
router.get('/get-by-hazardid/:hazardId',getCapasByHazardId)
router.get('/get-by-userid/:userId',getCapasByTechnicianId)
router.get('/get-completed-unapproved', getCompletedUnapprovedCapas)
router.delete('/delete/:id', deleteCapa)
router.put('/update/:id',addCapa)
router.patch('/isapproved/:capaId',approveCapasByEstateMenager)
router.get('/get-completed-approved/:userId', getCompletedApprovedCapasByTechnicianId)

export default router;