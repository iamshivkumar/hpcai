const Activity = require('../models/Activity');

// Create a new activity
const createActivity = async (req, res) => {
  try {
    req.body.createdBy = req.user.id;
    const newActivity = await Activity.create(req.body);
    res.status(201).json(newActivity);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Update an activity
const updateActivity = async (req, res) => {
  try {
    const { id } = req.params;

        req.updatedBy = req.user.id;


    const updated = await Activity.findByIdAndUpdate(
      id,
      { $set: req.body },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Activity not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Soft delete an activity
const deleteActivity = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Activity.findByIdAndUpdate(
      id,
      { $set: { active: false } },
      { new: true }
    );

    if (!deleted) return res.status(404).json({ error: 'Activity not found' });

    res.status(200).json({ message: 'Activity marked as inactive' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// List activities with filters
const listActivities = async (req, res) => {
  try {

    const { grade, area, medium, schoolId } = req.query;

    const query = { };


    if (grade) query.grade = grade;
    if (area) query.area = area;
    if (medium) query.medium = medium;
    if (schoolId) query.schoolId = schoolId;



    const activities = await Activity.find(query);

    res.status(200).json(activities);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createActivity,
  updateActivity,
  deleteActivity,
  listActivities,
};
