import "dotenv/config";
import type { Request, Response, Application } from 'express';
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import hazards_routers from './routers/hazards_routers.ts';
import { PrismaClient } from '@prisma/client';
import { PrismaPg } from '@prisma/adapter-pg';



dotenv.config();
const app: Application = express();
const port = process.env.PORT || 3000; // This controls the backend server address

// Configure CORS options
const corsOptions: cors.CorsOptions = {
  // This controls which frontend is allowed to connect
  origin: process.env.PORT || 'http://localhost:3000', 
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
};

// Initialize Prisma Client with PostgreSQL adapter
const connectionString = `${process.env.DATABASE_URL}`;
const adapter = new PrismaPg({ connectionString });
const prisma = new PrismaClient({ adapter });

export { prisma };

// Middleware to parse JSON bodies
app.use(express.json());
app.use(cors(corsOptions));

// Routes

app.use('/hazards',hazards_routers)



app.listen(port, () => {
    console.log(`Server Running at http://localhost:${port}`);
});
