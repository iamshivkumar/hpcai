const mongoose = require('mongoose');
const Timetable = require('../models/Timetable');


// ✅ Create a timetable
const createTimetable = async (req, res) => {
  try {
    const { schoolId, classId, appliedDate, closedDate, days } = req.body;

    const timetable = await Timetable.create({
      schoolId,
      classId,
      appliedDate,
      closedDate,
      days,
      createdBy: req.user.id,
      updatedBy: req.user.id
    });

    res.status(201).json(timetable);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// ✅ Edit timetable by ID (patch)
const editTimetable = async (req, res) => {
  try {
    const { id } = req.params;
    const updates = { ...req.body, updatedBy: req.user.id };

    const updated = await Timetable.findByIdAndUpdate(
      id,
      { $set: updates },
      { new: true, runValidators: true }
    );

    if (!updated) return res.status(404).json({ error: 'Timetable not found' });

    res.status(200).json(updated);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// ✅ Get active timetable by classId and date
const getTimetableByClassAndDate = async (req, res) => {
  try {
    const { classId } = req.params;
    const { date } = req.query;

    if (!date) return res.status(400).json({ error: 'Date is required' });

    const targetDate = new Date(date);
    const query = {
      classId: new mongoose.Types.ObjectId(classId),
      appliedDate: { $lte: targetDate },
      $or: [
        { closedDate: { $exists: false } },
        { closedDate: { $gte: targetDate } }
      ]
    };

    const timetable = await Timetable.findOne(query).sort({ appliedDate: -1 });

    if (!timetable) return res.status(404).json({ error: 'No timetable found for this date' });

    res.status(200).json(timetable);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

module.exports = {
  createTimetable,
  editTimetable,
  getTimetableByClassAndDate
};
