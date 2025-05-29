const Group = require('../models/Group');

// Create a new group
const createGroup = async (req, res) => {
  try {
    const newGroup = await Group.create(req.body);
    res.status(201).json(newGroup);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update a group
const updateGroup = async (req, res) => {
  try {
    const { id } = req.params;

    // Prevent changing schoolId or classId if desired
    const { schoolId, classId, ...updateBody } = req.body;

    const updated = await Group.findByIdAndUpdate(
      id,
      { $set: updateBody },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Group not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete a group (set active to false)
const deleteGroup = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Group.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Group not found' });

    res.status(200).json({ message: 'Group marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List groups by classId
const listGroupsByClass = async (req, res) => {
  try {
    const { classId } = req.params;

    const groups = await Group.find({ classId, active: true });

    res.status(200).json(groups);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createGroup,
  updateGroup,
  deleteGroup,
  listGroupsByClass
};
