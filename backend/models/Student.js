// models/Student.js
const mongoose = require('mongoose');

const studentSchema = new mongoose.Schema({
  classId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Class',
    required: true
  },
  schoolId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'School',
    required: true
  },
  name: {
    type: String,
    required: true
  },
  image: {
    type: String,
    required: false
  },
  rollNo: {
    type: Number,
    required: true
  },
  active: {
    type: Boolean,
    default: true
  }
}, { timestamps: true });


studentSchema.pre(/^find/, function (next) {
  // `this` refers to the current query
  this.where({ active: { $eq: true } });
  next();
});

module.exports = mongoose.model('Student', studentSchema);
