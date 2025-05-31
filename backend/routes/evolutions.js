const express = require('express');
const {
  createEvolution,
  updateEvolution,
  deleteEvolution,
  getEvolutionById,
  listEvolutions
} = require('../controllers/evolutionController');

const { verifyToken } = require('../middleware/auth');

const router = express.Router();

router.post('/', verifyToken(), createEvolution);
router.patch('/:id', verifyToken(), updateEvolution);
router.delete('/:id', verifyToken(), deleteEvolution);
router.get('/:id', verifyToken(), getEvolutionById);
router.get('/', verifyToken(), listEvolutions);

module.exports = router;
