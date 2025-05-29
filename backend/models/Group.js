// models/Group.js
const mongoose = require('mongoose');

const groupSchema = new mongoose.Schema({
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
  area: {
    type: String,
    required: false
  },
  studentIds: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Student'
  }],
  primary: {
    type: Boolean,
    default: false
  },
  active: {
    type: Boolean,
    default: true
  }
}, { timestamps: true });


groupSchema.pre(/^find/, function (next) {
  // `this` refers to the current query
  this.where({ active: { $eq: true } });
  next();
});

module.exports = mongoose.model('Group', groupSchema);
