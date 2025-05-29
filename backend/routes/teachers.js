// routes/teacherRoutes.js
const express = require('express');
const {
  createTeacher,
  updateTeacher,
  deleteTeacher,
  listTeachersBySchool
} = require('../controllers/teacherController');

const router = express.Router();

router.post('/', createTeacher);
router.patch('/:id', updateTeacher);
router.delete('/:id', deleteTeacher);
router.get('/school/:schoolId', listTeachersBySchool);

module.exports = router;
