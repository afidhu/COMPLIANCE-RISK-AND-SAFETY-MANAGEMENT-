-- DropForeignKey
ALTER TABLE "MitigationAction" DROP CONSTRAINT "MitigationAction_riskId_fkey";

-- AlterTable
ALTER TABLE "MitigationAction" ALTER COLUMN "riskId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;
