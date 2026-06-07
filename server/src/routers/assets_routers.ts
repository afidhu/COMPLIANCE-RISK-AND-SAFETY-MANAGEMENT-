
import { Router } from "express";
import { addAsset, deleteAsset, getAssets, updateAsset } from "../controllers/assets_controllers/crud_assets.ts";




const router = Router();

router.post('/add',addAsset)
router.get('/get',getAssets)
router.put('/update/:id',updateAsset)
router.delete('/delete/:id',deleteAsset)

export default router;