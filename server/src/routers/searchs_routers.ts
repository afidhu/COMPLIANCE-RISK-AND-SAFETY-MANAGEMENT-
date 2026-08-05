import express from 'express';
import { searchesAllDetails,getAssetsRisksIncidents } from '../controllers/searchs_controller/searches_controller';

const router = express.Router();

router.get('/all-details', searchesAllDetails);
router.get('/all-assets-risks-incidents', getAssetsRisksIncidents);



export default router;
