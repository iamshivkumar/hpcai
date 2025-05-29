const express = require('express');
const {
  createActivity,
  updateActivity,
  deleteActivity,
  listActivities,
} = require('../controllers/activityController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createActivity);
router.patch('/:id', verifyToken(), updateActivity);
router.delete('/:id', verifyToken(), deleteActivity);

// Example: GET /activities?grade=Grade1&area=science&schoolId=123
router.get('/', verifyToken(), listActivities);

module.exports = router;
