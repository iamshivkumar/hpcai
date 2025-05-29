// routes/studentRoutes.js
const express = require('express');
const {
  createStudent,
  updateStudent,
  deleteStudent,
  listStudentsByClass
} = require('../controllers/studentController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createStudent);
router.patch('/:id', verifyToken(), updateStudent);
router.delete('/:id', verifyToken(), deleteStudent);
router.get('/class/:classId', verifyToken(), listStudentsByClass);

module.exports = router;
