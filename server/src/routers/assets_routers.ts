
import { Router } from "express";
import { addAsset, deleteAsset, getAssetByHazardId, getAssetById, getAssets, updateAsset } from "../controllers/assets_controllers/crud_assets.ts";




const router = Router();

router.post('/add',addAsset)
router.get('/get',getAssets)
router.get('/get/:id',getAssetById)
router.get('/get-by-hazardid/:hazardid',getAssetByHazardId)
router.put('/update/:id',updateAsset)
router.delete('/delete/:id',deleteAsset)

export default router;