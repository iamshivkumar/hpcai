// routes/groupRoutes.js
const express = require('express');
const {
  createGroup,
  updateGroup,
  deleteGroup,
  listGroupsByClass
} = require('../controllers/groupController');

const router = express.Router();

router.post('/', createGroup);
router.patch('/:id', updateGroup);
router.delete('/:id', deleteGroup);
router.get('/class/:classId', listGroupsByClass);

module.exports = router;
