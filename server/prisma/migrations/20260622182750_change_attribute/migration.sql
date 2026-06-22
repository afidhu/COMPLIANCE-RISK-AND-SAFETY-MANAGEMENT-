-- DropForeignKey
ALTER TABLE "Incident" DROP CONSTRAINT "Incident_riskId_fkey";

-- AlterTable
ALTER TABLE "Incident" ALTER COLUMN "riskId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;
