-- DropForeignKey
ALTER TABLE "CapaAction" DROP CONSTRAINT "CapaAction_assignedById_fkey";

-- AlterTable
ALTER TABLE "CapaAction" ALTER COLUMN "assignedById" DROP NOT NULL,
ALTER COLUMN "assignedById" DROP DEFAULT;

-- AlterTable
ALTER TABLE "Compliance" ADD COLUMN     "expiredDate" TIMESTAMP(3);

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("userId") ON DELETE SET NULL ON UPDATE CASCADE;
