/*
  Warnings:

  - The `assetType` column on the `Asset` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Added the required column `riskDescription` to the `Risk` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "AssetsType" AS ENUM ('ELECTRICAL_DEVICE', 'BOILER', 'LIFT', 'PRESSURE_VESSEL', 'EXPLOSIVES');

-- AlterTable
ALTER TABLE "Asset" DROP COLUMN "assetType",
ADD COLUMN     "assetType" "AssetsType" NOT NULL DEFAULT 'ELECTRICAL_DEVICE';

-- AlterTable
ALTER TABLE "CapaAction" ALTER COLUMN "actionType" SET DEFAULT 'CORRECTIVE',
ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "Compliance" ALTER COLUMN "status" SET DEFAULT 'COMPLIANT';

-- AlterTable
ALTER TABLE "Hazard" ALTER COLUMN "status" SET DEFAULT 'OPEN';

-- AlterTable
ALTER TABLE "Incident" ALTER COLUMN "severity" SET DEFAULT 'MEDIUM';

-- AlterTable
ALTER TABLE "MitigationAction" ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "Risk" ADD COLUMN     "riskDescription" TEXT NOT NULL,
ALTER COLUMN "likelihood" SET DEFAULT 'POSSIBLE',
ALTER COLUMN "severity" SET DEFAULT 'MEDIUM',
ALTER COLUMN "riskLevel" DROP NOT NULL,
ALTER COLUMN "status" SET DEFAULT 'OPEN';
