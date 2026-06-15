-- DropForeignKey
ALTER TABLE "CapaAction" DROP CONSTRAINT "CapaAction_riskId_fkey";

-- AlterTable
ALTER TABLE "CapaAction" ALTER COLUMN "riskId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;
