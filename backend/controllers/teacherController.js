const Teacher = require('../models/Teacher');

// Create a new teacher
const createTeacher = async (req, res) => {
  try {
    const newTeacher = await Teacher.create(req.body);
    res.status(201).json(newTeacher);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update a teacher (PATCH)
const updateTeacher = async (req, res) => {
  try {
    const { id } = req.params;

    // Avoid updating schoolId if you want to lock it
    const { schoolId, ...body } = req.body;

    const updated = await Teacher.findByIdAndUpdate(
      id,
      { $set: body },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Teacher not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete a teacher
const deleteTeacher = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Teacher.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Teacher not found' });

    res.status(200).json({ message: 'Teacher marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List teachers by schoolId
const listTeachersBySchool = async (req, res) => {
  try {
    const { schoolId } = req.params;

    const teachers = await Teacher.find({ schoolId, active: true });

    res.status(200).json(teachers);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createTeacher,
  updateTeacher,
  deleteTeacher,
  listTeachersBySchool
};
