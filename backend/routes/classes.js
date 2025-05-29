// routes/classRoutes.js
const express = require('express');
const {
    createClass,
    updateClass,
    deleteClass,
    listClassesBySchool
} = require('../controllers/classController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createClass);
router.patch('/:id', verifyToken(), updateClass);
router.delete('/:id', verifyToken(), deleteClass);
router.get('/school/:schoolId', verifyToken(), listClassesBySchool);

module.exports = router;
