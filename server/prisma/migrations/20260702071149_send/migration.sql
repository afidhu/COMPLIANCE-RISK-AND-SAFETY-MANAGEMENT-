-- AlterTable
ALTER TABLE "CapaAction" ADD COLUMN     "assignedById" TEXT;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("userId") ON DELETE SET NULL ON UPDATE CASCADE;
