-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ESTATE_MANAGER', 'INSPECTOR', 'SAFETY_OFFICER', 'TECHNICIAN', 'STAFF_MEMBER', 'ADMIN');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "AssetStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'UNDER_MAINTENANCE', 'RETIRED');

-- CreateEnum
CREATE TYPE "ComplianceStatus" AS ENUM ('COMPLIANT', 'DUE_SOON', 'OVERDUE');

-- CreateEnum
CREATE TYPE "HazardStatus" AS ENUM ('OPEN', 'UNDER_REVIEW', 'CLOSED');

-- CreateEnum
CREATE TYPE "RiskStatus" AS ENUM ('OPEN', 'MITIGATED', 'CLOSED');

-- CreateEnum
CREATE TYPE "ActionStatus" AS ENUM ('PENDING', 'IN_PROGRESS', 'COMPLETED');

-- CreateEnum
CREATE TYPE "Severity" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "Likelihood" AS ENUM ('RARE', 'UNLIKELY', 'POSSIBLE', 'LIKELY', 'ALMOST_CERTAIN');

-- CreateEnum
CREATE TYPE "CAPAType" AS ENUM ('CORRECTIVE', 'PREVENTIVE');

-- CreateTable
CREATE TABLE "User" (
    "userId" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "phone" TEXT,
    "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Asset" (
    "assetId" TEXT NOT NULL,
    "assetName" TEXT NOT NULL,
    "assetType" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "serialNo" TEXT,
    "status" "AssetStatus" NOT NULL DEFAULT 'ACTIVE',
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Asset_pkey" PRIMARY KEY ("assetId")
);

-- CreateTable
CREATE TABLE "Compliance" (
    "complianceId" TEXT NOT NULL,
    "complianceName" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "lastDueDate" TIMESTAMP(3),
    "dueDate" TIMESTAMP(3) NOT NULL,
    "status" "ComplianceStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Compliance_pkey" PRIMARY KEY ("complianceId")
);

-- CreateTable
CREATE TABLE "Hazard" (
    "hazardId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "complianceId" TEXT,
    "hazardTitle" TEXT NOT NULL,
    "hazardDescription" TEXT NOT NULL,
    "reportedById" TEXT NOT NULL,
    "status" "HazardStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Hazard_pkey" PRIMARY KEY ("hazardId")
);

-- CreateTable
CREATE TABLE "Risk" (
    "riskId" TEXT NOT NULL,
    "hazardId" TEXT NOT NULL,
    "riskTitle" TEXT NOT NULL,
    "likelihood" "Likelihood" NOT NULL,
    "severity" "Severity" NOT NULL,
    "riskLevel" TEXT NOT NULL,
    "status" "RiskStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Risk_pkey" PRIMARY KEY ("riskId")
);

-- CreateTable
CREATE TABLE "Incident" (
    "incidentId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "riskId" TEXT NOT NULL,
    "incidentTitle" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "incidentDate" TIMESTAMP(3) NOT NULL,
    "severity" "Severity" NOT NULL,
    "reportedById" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Incident_pkey" PRIMARY KEY ("incidentId")
);

-- CreateTable
CREATE TABLE "MitigationAction" (
    "mitigationId" TEXT NOT NULL,
    "riskId" TEXT NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "assignedToId" TEXT NOT NULL,
    "targetDate" TIMESTAMP(3) NOT NULL,
    "status" "ActionStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MitigationAction_pkey" PRIMARY KEY ("mitigationId")
);

-- CreateTable
CREATE TABLE "CapaAction" (
    "capaId" TEXT NOT NULL,
    "riskId" TEXT NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "actionType" "CAPAType" NOT NULL,
    "assignedToId" TEXT NOT NULL,
    "dueDate" TIMESTAMP(3) NOT NULL,
    "status" "ActionStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CapaAction_pkey" PRIMARY KEY ("capaId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- AddForeignKey
ALTER TABLE "Asset" ADD CONSTRAINT "Asset_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Compliance" ADD CONSTRAINT "Compliance_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("assetId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hazard" ADD CONSTRAINT "Hazard_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("assetId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hazard" ADD CONSTRAINT "Hazard_complianceId_fkey" FOREIGN KEY ("complianceId") REFERENCES "Compliance"("complianceId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hazard" ADD CONSTRAINT "Hazard_reportedById_fkey" FOREIGN KEY ("reportedById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Risk" ADD CONSTRAINT "Risk_hazardId_fkey" FOREIGN KEY ("hazardId") REFERENCES "Hazard"("hazardId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("assetId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_reportedById_fkey" FOREIGN KEY ("reportedById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_assignedToId_fkey" FOREIGN KEY ("assignedToId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedToId_fkey" FOREIGN KEY ("assignedToId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;
