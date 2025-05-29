const express = require('express');
const router = express.Router();
const { updateUser } = require('../controllers/userController');
const { verifyToken } = require('../middleware/auth');

router.patch('/', verifyToken(), updateUser);

module.exports = router;