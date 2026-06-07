/*
  Warnings:

  - The values [UNDER_REVIEW] on the enum `HazardStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "HazardStatus_new" AS ENUM ('OPEN', 'IN_PROGRESS', 'CLOSED');
ALTER TABLE "public"."Hazard" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "Hazard" ALTER COLUMN "status" TYPE "HazardStatus_new" USING ("status"::text::"HazardStatus_new");
ALTER TYPE "HazardStatus" RENAME TO "HazardStatus_old";
ALTER TYPE "HazardStatus_new" RENAME TO "HazardStatus";
DROP TYPE "public"."HazardStatus_old";
ALTER TABLE "Hazard" ALTER COLUMN "status" SET DEFAULT 'OPEN';
COMMIT;

-- AlterTable
ALTER TABLE "Asset" ALTER COLUMN "assetType" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Incident" ALTER COLUMN "status" DROP NOT NULL;
