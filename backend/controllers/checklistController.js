const Checklist = require('../models/Checklist');

// Create Checklist
const createChecklist = async (req, res) => {
  try {
        req.body.createdBy = req.user.id;

    const newChecklist = await Checklist.create(req.body);
    res.status(201).json(newChecklist);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update Checklist
const updateChecklist = async (req, res) => {
  try {
    const { id } = req.params;

            req.body.updatedBy = req.user.id;


    const updated = await Checklist.findByIdAndUpdate(
      id,
      { $set: req.body },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Checklist not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Delete Checklist (Soft Delete)
const deleteChecklist = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Checklist.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Checklist not found' });

    res.status(200).json({ message: 'Checklist marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List Checklists
const listChecklists = async (req, res) => {
  try {
    const { classId, area, term, medium, schoolId } = req.query;

    const query = { active: true };

    if (classId) query.classId = classId;
    if (area) query.area = area;
    if (term) query.term = term;
    if (medium) query.medium = medium;
    if (schoolId) query.schoolId = schoolId;

    const checklists = await Checklist.find(query);

    res.status(200).json(checklists);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createChecklist,
  updateChecklist,
  deleteChecklist,
  listChecklists
};
