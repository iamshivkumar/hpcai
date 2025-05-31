const express = require('express');
const {
  updateAssessment,
  deleteAssessment,
  listAssessments,
  getAssessmentById
} = require('../controllers/assessmentController');

const {
  generateAssessment,
} = require('../controllers/assessmentGenController');

const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), generateAssessment);
router.patch('/:id', verifyToken(), updateAssessment);
router.delete('/:id', verifyToken(), deleteAssessment);
router.get('/:id', verifyToken(), getAssessmentById);

router.get('/', verifyToken(), listAssessments);

module.exports = router;
