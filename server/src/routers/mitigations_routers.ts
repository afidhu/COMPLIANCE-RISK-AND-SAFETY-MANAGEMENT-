import { Router } from "express";
import { addMitigationAction, deleteMitigationAction, getMitigationActionById, getMitigationActions, getMitigationActionsByHazardId, getMitigationActionsByRiskId, updateMitigationAction } from "../controllers/mitigation_action/crud_mitigation.ts";




const router = Router();

router.post('/add',addMitigationAction)
router.get('/get',getMitigationActions)
router.get('/get/:id',getMitigationActionById)
router.get('/get-by-riskid/:riskid',getMitigationActionsByRiskId)
router.get('/get-by-hazardid/:hazardId',getMitigationActionsByHazardId)
router.put('/update/:id',updateMitigationAction)
router.delete('/delete/:id',deleteMitigationAction)

export default router;