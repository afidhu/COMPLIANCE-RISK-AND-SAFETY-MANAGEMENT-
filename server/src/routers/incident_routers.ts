import { Router } from "express";
import { addIncident, deleteIncident, getIncidentById, getIncidents, updateIncident } from "../controllers/incidents_controller/crud_incidents";




const router = Router();

router.post('/add',addIncident)
router.get('/get',getIncidents)
router.get('/get/:id',getIncidentById)
router.put('/update/:id',updateIncident)
router.delete('/delete/:id',deleteIncident)

export default router;