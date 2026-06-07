import { Router } from "express";
import { addMitigationAction, deleteMitigationAction, getMitigationActionById, getMitigationActions, updateMitigationAction } from "../controllers/mitigation_action/crud_mitigation.ts";




const router = Router();

router.post('/add',addMitigationAction)
router.get('/get',getMitigationActions)
router.get('/get/:id',getMitigationActionById)
router.put('/update/:id',updateMitigationAction)
router.delete('/delete/:id',deleteMitigationAction)

export default router;