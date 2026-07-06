-- AlterEnum
ALTER TYPE "UserRole" ADD VALUE 'SYSTEM';

-- AlterTable
ALTER TABLE "MitigationAction" ALTER COLUMN "hazardId" DROP DEFAULT;
