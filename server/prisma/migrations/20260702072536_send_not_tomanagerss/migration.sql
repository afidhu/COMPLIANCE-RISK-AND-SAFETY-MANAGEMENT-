/*
  Warnings:

  - A unique constraint covering the columns `[assignedById]` on the table `CapaAction` will be added. If there are existing duplicate values, this will fail.
  - Made the column `assignedById` on table `CapaAction` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "CapaAction" DROP CONSTRAINT "CapaAction_assignedById_fkey";

-- AlterTable
ALTER TABLE "CapaAction" ALTER COLUMN "assignedById" SET NOT NULL,
ALTER COLUMN "assignedById" SET DEFAULT 'bda3a186-5e4d-44df-8312-911c68f6a97c';

-- CreateIndex
CREATE UNIQUE INDEX "CapaAction_assignedById_key" ON "CapaAction"("assignedById");

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;
