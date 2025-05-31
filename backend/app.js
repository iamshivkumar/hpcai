const express = require('express');
     const cors = require('cors');
     const helmet = require('helmet');
     const rateLimit = require('express-rate-limit');
     const winston = require('winston');
     const connectDB = require('./config/db');
     const authRoutes = require('./routes/auth');
     const userRoutes = require('./routes/users');
     const schoolRoutes = require('./routes/schools');
     const classesRoutes = require('./routes/classes');
     const teachersRoutes = require('./routes/teachers');
     const studentsRoutes = require('./routes/students');
     const assessmentsRoutes = require('./routes/assessments');
     const evolutionsRoutes = require('./routes/evolutions');
     const config = require('./config/config');

     const app = express();

     // Logger setup
     const logger = winston.createLogger({
       level: 'info',
       format: winston.format.combine(
         winston.format.timestamp(),
         winston.format.json()
       ),
       transports: [
         new winston.transports.Console(),
         new winston.transports.File({ filename: 'error.log', level: 'error' }),
         new winston.transports.File({ filename: 'combined.log' }),
       ],
     });

     // Middleware
     app.use(helmet());
     app.use(cors());
     app.use(express.json());
     app.use(rateLimit({
       windowMs: 15 * 60 * 1000, // 15 minutes
       max: 100, // Limit each IP to 100 requests per windowMs
     }));

     // Routes
     app.use('/auth', authRoutes);
     app.use('/user', userRoutes);
     app.use('/schools', schoolRoutes);
     app.use('/classes', classesRoutes);
     app.use('/students', studentsRoutes);
     app.use('/teachers', teachersRoutes);
     app.use('/assessments', assessmentsRoutes);
     app.use('/evolutions', evolutionsRoutes);

     // Error handling
     app.use((err, req, res, next) => {
       logger.error(err.stack);
       res.status(500).json({ error: 'Internal server error' });
     });

     // Start server
     const startServer = async () => {
       await connectDB();
       app.listen(config.port, () => {
         logger.info(`Server running on port ${config.port}`);
       });
     };

     startServer();

     module.exports = app;