const Assessment = require('../models/Assessment');

// Create a new assessment
const createAssessment = async (req, res) => {
  try {
    const newAssessment = await Assessment.create(req.body);
    res.status(201).json(newAssessment);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update an assessment
const updateAssessment = async (req, res) => {
  try {
    const { id } = req.params;

    const updated = await Assessment.findByIdAndUpdate(
      id,
      { $set: req.body },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Assessment not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete an assessment
const deleteAssessment = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Assessment.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Assessment not found' });

    res.status(200).json({ message: 'Assessment marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List assessments with filters
const listAssessments = async (req, res) => {
  try {
    const { classId, area, medium, term, schoolId } = req.query;

    const query = { active: { $ne: false } };

    if (classId) query.classId = classId;
    if (area) query.area = area;
    if (medium) query.medium = medium;
    if (term) query.term = term;
    if (schoolId) query.schoolId = schoolId;

    const assessments = await Assessment.find(query);

    res.status(200).json(assessments);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createAssessment,
  updateAssessment,
  deleteAssessment,
  listAssessments
};
