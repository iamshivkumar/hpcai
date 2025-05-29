// models/Teacher.js
const mongoose = require('mongoose');

const teacherSchema = new mongoose.Schema({
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
  active: {
    type: Boolean,
    default: true
  }
}, { timestamps: true });


teacherSchema.pre(/^find/, function (next) {
  // `this` refers to the current query
  this.where({ active: { $eq: true } });
  next();
});

module.exports = mongoose.model('Teacher', teacherSchema);
