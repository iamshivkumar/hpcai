const Evolution = require('../models/Evolution');

// Create a new evolution
const createEvolution = async (req, res) => {
  try {
        req.body.createdBy = req.user.id;

    const newEvolution = await Evolution.create({
      ...req.body,
      createdBy: req.user.id
    });
    res.status(201).json(newEvolution);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update an evolution
const updateEvolution = async (req, res) => {
  try {
    const { id } = req.params;


        req.body.updatedBy = req.user.id;


    const updated = await Evolution.findByIdAndUpdate(
      id,
      {
        $set: {
          ...req.body,
          updatedBy: req.user.id
        }
      },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Evolution not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete an evolution
const deleteEvolution = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Evolution.findByIdAndUpdate(
      id,
      { $set: { active: false, updatedBy: req.user.id } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Evolution not found' });

    res.status(200).json({ message: 'Evolution marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Get single evolution by ID
const getEvolutionById = async (req, res) => {
  try {
    const { id } = req.params;
    const evolution = await Evolution.findById(id);

    if (!evolution || !evolution.active) {
      return res.status(404).json({ error: 'Evolution not found' });
    }

    res.status(200).json(evolution);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List evolutions with filters
const listEvolutions = async (req, res) => {
  try {
    const { schoolId, classId, assessmentId, studentId } = req.query;

    const query = { active: true };
    if (schoolId) query.schoolId = schoolId;
    if (classId) query.classId = classId;
    if (assessmentId) query.assessmentId = assessmentId;
    if (studentId) query.studentId = studentId;

    const evolutions = await Evolution.find(query);
    res.status(200).json(evolutions);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createEvolution,
  updateEvolution,
  deleteEvolution,
  getEvolutionById,
  listEvolutions,
};
