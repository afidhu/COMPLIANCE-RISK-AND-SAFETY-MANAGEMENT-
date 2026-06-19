import cron from 'node-cron';
import { prisma } from '../../index.ts';
import { addDays } from "date-fns";


export const complianceReminder = async () => {

    cron.schedule('* * * * * *', () => {
        console.log('object')
        runComplianceChecks()
    })
}

// complianceReminder()

export const runComplianceChecks = async () => {
    await checkBfDueDate();

    await checkCurrentDueDate();

    await checkOverdue();
};

// check if due date bf iwk


export const checkBfDueDate = async () => {
    const today = new Date();
    const nextWeek = addDays(today, 7);

    const dueSoon = await prisma.compliance.findMany({
        where: {
            dueDate: {
                gte: today,
                lte: nextWeek,
            },
        },
    });

    if (dueSoon.length > 0) {

        const updated = await prisma.compliance.updateMany({
            where: {
                dueDate: {
                    gte: today,
                    lte: nextWeek,
                }
            },
            data: {
                status: "DUE_SOON"
            }
        })


        console.log('dueSoon:', dueSoon)
    }
    return dueSoon;

};


// check if due date has reach 

export const checkCurrentDueDate = async () => {
    const startOfDay = new Date();
    startOfDay.setHours(0, 0, 0, 0);

    const endOfDay = new Date();
    endOfDay.setHours(23, 59, 59, 999);

    const dueToday = await prisma.compliance.findMany({
        where: {
            dueDate: {
                gte: startOfDay,
                lte: endOfDay,
            },
        },
    });
    console.log('dueToday', dueToday)

    return dueToday;
};


// check if due date has overdue

export const checkOverdue = async () => {
    const today = new Date();

    const overdue = await prisma.compliance.findMany({
        where: {
            dueDate: {
                lt: today,
            },
            status: {
                not: "OVERDUE",
            },
        },
    });
    //  console.log('Overdue:', overdue)
    if (overdue.length > 0) {

        const updatedCompliance = await prisma.compliance.updateMany({
            where: {
                dueDate: {
                    lt: today,
                }
            },
            data: {
                status: "OVERDUE"
            }
        })

        // Now create Hazard automatic, with the title of missed expected was occured

        if (updatedCompliance.count > 0) {

            for (const item of overdue) {

                await prisma.hazard.create({
                    data: {
                        assetId: item.assetId,

                        hazardTitle:
                            `Missed Compliance - ${item.complianceName}`,

                        hazardDescription:
                            `${item.complianceName} became overdue on ${item.dueDate.toISOString().split('T')[0]}. The required compliance activity was not completed before the due date`,

                        // Use System User ID
                        reportedById: '1',
                        status: "OPEN",
                    },
                });

            }
        }

        console.log('Overdue:', overdue)
    }

    return overdue;
};