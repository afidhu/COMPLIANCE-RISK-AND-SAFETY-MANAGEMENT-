-- AlterTable
ALTER TABLE "CapaAction" ADD COLUMN     "hazardId" TEXT NOT NULL DEFAULT 'cmq3vb19g0002d5e2c24ittfn';

-- AlterTable
ALTER TABLE "MitigationAction" ADD COLUMN     "hazardId" TEXT NOT NULL DEFAULT 'cmq3vb19g0002d5e2c24ittfn';

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_hazardId_fkey" FOREIGN KEY ("hazardId") REFERENCES "Hazard"("hazardId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_hazardId_fkey" FOREIGN KEY ("hazardId") REFERENCES "Hazard"("hazardId") ON DELETE RESTRICT ON UPDATE CASCADE;
