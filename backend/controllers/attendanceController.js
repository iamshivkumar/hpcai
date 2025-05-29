const Attendance = require('../models/Attendance');
const mongoose = require('mongoose');

// ✅ Write (Create or Update Attendance)
const write = async (req, res) => {
    try {
      const { schoolId, classId, studentId, date, datetime, status } = req.body;
  
      const record = await Attendance.findOneAndUpdate(
        { studentId, date }, // use string date for uniqueness
        {
          $set: {
            schoolId,
            classId,
            datetime,
            status,
            updatedBy: req.user.id
          },
          $setOnInsert: {
            createdBy: req.user.id
          }
        },
        {
          new: true,
          upsert: true,
          runValidators: true
        }
      );
  
      res.status(200).json(record);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
  

// ✅ Delete Attendance
const remove = async (req, res) => {
  try {
    const { id } = req.params;

    const deleted = await Attendance.findByIdAndDelete(id);
    if (!deleted) return res.status(404).json({ error: 'Attendance not found' });

    res.status(200).json({ message: 'Attendance deleted' });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// ✅ List attendance with optional filters
const list = async (req, res) => {
    try {
      const { classId, studentId, startDate, endDate, date } = req.query;
  
      const filter = {};
  
      if (classId) filter.classId = classId;
      if (studentId) filter.studentId = studentId;
  
      if (date) {
        filter.date = date; // match exact string like "2025-05-20"
      } else if (startDate || endDate) {
        filter.datetime = {};
        if (startDate) filter.datetime.$gte = new Date(startDate);
        if (endDate) filter.datetime.$lte = new Date(endDate);
      }
  
      const records = await Attendance.find(filter).sort({ datetime: 1 });
      res.status(200).json(records);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  };
  

module.exports = {
  write,
  remove,
  list
};
