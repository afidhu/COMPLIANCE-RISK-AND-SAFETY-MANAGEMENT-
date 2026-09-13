import multer from 'multer';
import path from 'path';
import type { Request } from 'express';
import type { FileFilterCallback } from 'multer';

// Configure storage for uploaded files
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Files will be stored in the uploads directory
  },
  filename: (req, file, cb) => {
    // Generate unique filename with original extension
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const ext = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + ext);
  }
});

// File filter to accept any file type
const fileFilter = (req: Request, file: Express.Multer.File, cb: FileFilterCallback) => {
  // Accept any file type
  cb(null, true);
};

// Configure multer with storage and file filter
export const upload = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 10 * 1024 * 1024, // 10MB max file size
  }
});

// Export single file upload middleware
export const uploadSingle = upload.single('file');

// Export multiple files upload middleware
export const uploadMultiple = upload.array('files', 10);

// Export fields upload middleware for multiple file fields
export const uploadFields = upload.fields([
  { name: 'file', maxCount: 1 },
  { name: 'files', maxCount: 10 }
]);
