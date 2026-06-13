import "dotenv/config";
import type { Request, Response, Application } from 'express';
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import { PrismaClient } from '@prisma/client';
import { PrismaPg } from '@prisma/adapter-pg';

import hazards_routers from './routers/hazards_routers.ts';
import auth_routers from './routers/auth_routers.ts';
import incident_routers from './routers/incident_routers.ts';
import mitigations_routers from './routers/mitigations_routers.ts';
import risks_routers from './routers/risks_routers.ts';
import compliance_routers from './routers/compliance_routers.ts';
import capa_routers from './routers/capa_routers.ts';
import assets_routers from './routers/assets_routers.ts';


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
app.use(cors());
app.use(cors({
  origin: true,
  credentials: true
}));
// Routes
app.use('/auth', auth_routers);
app.use('/hazards', hazards_routers);
app.use('/incidents', incident_routers);
app.use('/mitigations', mitigations_routers);
app.use('/risks', risks_routers);
app.use('/compliance', compliance_routers);
app.use('/capa', capa_routers);
app.use('/assets',assets_routers);



app.listen(port, () => {
    console.log(`Server Running at http://localhost:${port}`);
});
