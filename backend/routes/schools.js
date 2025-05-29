// routes/classRoutes.js
const express = require('express');
const {
    getSchoolById,
    updateSchool,
    createSchool
} = require('../controllers/schoolController');
const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createSchool);
router.patch('/:id', verifyToken(), updateSchool);
// router.delete('/:id', verifyToken(), dele);
router.get('/:id', verifyToken(), getSchoolById);

module.exports = router;
