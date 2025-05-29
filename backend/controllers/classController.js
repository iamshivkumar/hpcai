const Class = require('../models/Class');

// POST: Create a new class
const createClass = async (req, res) => {
  try {
    const newClass = await Class.create(req.body);
    res.status(201).json(newClass);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// PATCH: Update an existing class
const updateClass = async (req, res) => {
  try {
    const { id } = req.params;

    // sanitize
    const { schoolId, ...body } = req.body;

    const updated = await Class.findByIdAndUpdate(
      id,
      { $set: body },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Class not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// DELETE (soft): Mark class inactive
const deleteClass = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Class.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Class not found' });

    res.status(200).json({ message: 'Class deleted successfully' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// GET: List all classes by schoolId
const listClassesBySchool = async (req, res) => {
  try {
    const { schoolId } = req.params;

    const classes = await Class.find({ schoolId, active: true });

    res.status(200).json(classes);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createClass,
  updateClass,
  deleteClass,
  listClassesBySchool
};
