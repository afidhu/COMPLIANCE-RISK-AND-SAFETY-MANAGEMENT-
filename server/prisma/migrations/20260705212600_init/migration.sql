-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('ESTATE_MANAGER', 'INSPECTOR', 'SAFETY_OFFICER', 'TECHNICIAN', 'STAFF_MEMBER', 'ADMIN', 'SYSTEM');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "AssetStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'UNDER_MAINTENANCE', 'RETIRED');

-- CreateEnum
CREATE TYPE "ComplianceStatus" AS ENUM ('COMPLIANT', 'DUE_SOON', 'OVERDUE');

-- CreateEnum
CREATE TYPE "HazardStatus" AS ENUM ('OPEN', 'IN_PROGRESS', 'CLOSED');

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

-- CreateEnum
CREATE TYPE "AssetsType" AS ENUM ('ELECTRICAL_DEVICE', 'BOILER', 'LIFT', 'PRESSURE_VESSEL', 'EXPLOSIVES');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('COMPLIANCE', 'CAPA', 'HAZARD', 'INCIDENT', 'INSPECTION', 'CERTIFICATE', 'APPROVAL');

-- CreateTable
CREATE TABLE "User" (
    "userId" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "role" "UserRole",
    "phone" TEXT,
    "playerId" TEXT,
    "status" "UserStatus" NOT NULL DEFAULT 'ACTIVE',
    "isApproved" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Asset" (
    "assetId" TEXT NOT NULL,
    "assetName" TEXT NOT NULL,
    "assetType" "AssetsType" NOT NULL,
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
    "expireDate" TIMESTAMP(3),
    "status" "ComplianceStatus" NOT NULL DEFAULT 'COMPLIANT',
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
    "status" "HazardStatus" NOT NULL DEFAULT 'OPEN',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Hazard_pkey" PRIMARY KEY ("hazardId")
);

-- CreateTable
CREATE TABLE "Risk" (
    "riskId" TEXT NOT NULL,
    "hazardId" TEXT NOT NULL,
    "riskTitle" TEXT NOT NULL,
    "riskDescription" TEXT NOT NULL,
    "likelihood" "Likelihood" NOT NULL DEFAULT 'POSSIBLE',
    "severity" "Severity" NOT NULL DEFAULT 'MEDIUM',
    "riskLevel" TEXT,
    "status" "RiskStatus" NOT NULL DEFAULT 'OPEN',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Risk_pkey" PRIMARY KEY ("riskId")
);

-- CreateTable
CREATE TABLE "Incident" (
    "incidentId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "riskId" TEXT,
    "incidentTitle" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "incidentDate" TIMESTAMP(3) NOT NULL,
    "severity" "Severity" NOT NULL DEFAULT 'MEDIUM',
    "reportedById" TEXT NOT NULL,
    "status" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Incident_pkey" PRIMARY KEY ("incidentId")
);

-- CreateTable
CREATE TABLE "MitigationAction" (
    "mitigationId" TEXT NOT NULL,
    "riskId" TEXT,
    "hazardId" TEXT NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "assignedToId" TEXT NOT NULL,
    "targetDate" TIMESTAMP(3) NOT NULL,
    "status" "ActionStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MitigationAction_pkey" PRIMARY KEY ("mitigationId")
);

-- CreateTable
CREATE TABLE "CapaAction" (
    "capaId" TEXT NOT NULL,
    "riskId" TEXT,
    "hazardId" TEXT NOT NULL,
    "actionTitle" TEXT NOT NULL,
    "actionType" "CAPAType" NOT NULL DEFAULT 'CORRECTIVE',
    "assignedToId" TEXT NOT NULL,
    "assignedById" TEXT NOT NULL DEFAULT 'bda3a186-5e4d-44df-8312-911c68f6a97c',
    "dueDate" TIMESTAMP(3) NOT NULL,
    "isApproved" BOOLEAN NOT NULL DEFAULT false,
    "status" "ActionStatus" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CapaAction_pkey" PRIMARY KEY ("capaId")
);

-- CreateTable
CREATE TABLE "Notification" (
    "notify_id" TEXT NOT NULL,
    "sender_id" TEXT NOT NULL,
    "receiver_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "notify_type" "NotificationType" NOT NULL,
    "reference_id" TEXT,
    "is_read" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("notify_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_playerId_key" ON "User"("playerId");

-- CreateIndex
CREATE UNIQUE INDEX "CapaAction_assignedById_key" ON "CapaAction"("assignedById");

-- CreateIndex
CREATE INDEX "Notification_sender_id_idx" ON "Notification"("sender_id");

-- CreateIndex
CREATE INDEX "Notification_receiver_id_idx" ON "Notification"("receiver_id");

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
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Incident" ADD CONSTRAINT "Incident_reportedById_fkey" FOREIGN KEY ("reportedById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_hazardId_fkey" FOREIGN KEY ("hazardId") REFERENCES "Hazard"("hazardId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MitigationAction" ADD CONSTRAINT "MitigationAction_assignedToId_fkey" FOREIGN KEY ("assignedToId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_riskId_fkey" FOREIGN KEY ("riskId") REFERENCES "Risk"("riskId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_hazardId_fkey" FOREIGN KEY ("hazardId") REFERENCES "Hazard"("hazardId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedToId_fkey" FOREIGN KEY ("assignedToId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CapaAction" ADD CONSTRAINT "CapaAction_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "User"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_receiver_id_fkey" FOREIGN KEY ("receiver_id") REFERENCES "User"("userId") ON DELETE CASCADE ON UPDATE CASCADE;
