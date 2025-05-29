const Student = require('../models/Student');

// Create a new student
const createStudent = async (req, res) => {
  try {
    const newStudent = await Student.create(req.body);
    res.status(201).json(newStudent);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update a student (PATCH)
const updateStudent = async (req, res) => {
  try {
    const { id } = req.params;

    // Prevent changing schoolId or classId if needed
    const { schoolId, classId, ...updateBody } = req.body;

    const updated = await Student.findByIdAndUpdate(
      id,
      { $set: updateBody },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Student not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete a student
const deleteStudent = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Student.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Student not found' });

    res.status(200).json({ message: 'Student marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List students by classId
const listStudentsByClass = async (req, res) => {
  try {
    const { classId } = req.params;

    const students = await Student.find({ classId, active: true });

    res.status(200).json(students);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createStudent,
  updateStudent,
  deleteStudent,
  listStudentsByClass
};
