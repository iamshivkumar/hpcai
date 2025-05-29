const mongoose = require('mongoose');

const SlotSchema = new mongoose.Schema({
  teacherId: { type: mongoose.Schema.Types.ObjectId, ref: 'Teacher', required: false },
  area: String,
  name: { type: String, required: true },
  startTime: { type: String, required: true }, // e.g. '09:00' (24h format)
  endTime: { type: String, required: true },   // e.g. '10:00'
  type: { 
    type: String, 
    enum: ['lecture', 'activity', 'assessment', 'break', 'other'], 
    required: true 
  },
});

const TimetableSchema = new mongoose.Schema({
  schoolId: { type: mongoose.Schema.Types.ObjectId, ref: 'School', required: true },
  classId: { type: mongoose.Schema.Types.ObjectId, ref: 'Class', required: true },

  appliedDate: { type: Date, required: true },  // When timetable starts applying
  closedDate: { type: Date, required: false },  // Optional end date

  // days: Map of weekday index (0-6) to array of slots
  days: {
    type: Map,
    of: [SlotSchema],
    required: true,
    validate: {
      validator: function(value) {
        // keys must be integers 0-6
        return [...value.keys()].every(k => Number(k) >= 0 && Number(k) <= 6);
      },
      message: 'Day keys must be integers between 0 (Sunday) and 6 (Saturday)'
    }
  },

  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  updatedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true }
}, { timestamps: true });

module.exports = mongoose.model('Timetable', TimetableSchema);
