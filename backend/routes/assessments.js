const express = require('express');
const {
  createAssessment,
  updateAssessment,
  deleteAssessment,
  listAssessments,
} = require('../controllers/assessmentController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createAssessment);
router.patch('/:id', verifyToken(), updateAssessment);
router.delete('/:id', verifyToken(), deleteAssessment);

// Example: GET /assessments?grade=Grade1&area=science&schoolId=123
router.get('/', verifyToken(), listAssessments);

module.exports = router;
