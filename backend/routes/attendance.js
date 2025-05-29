// routes/attendanceRoutes.js
const express = require('express');
const {
  write,
  remove,
  list
} = require('../controllers/attendanceController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), write);        // Create or update attendance
router.delete('/:id', verifyToken(), remove);  // Delete attendance by ID
router.get('/', verifyToken(), list);          // List attendance with optional filters

module.exports = router;
