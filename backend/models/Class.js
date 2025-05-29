// models/Class.js
const mongoose = require('mongoose');

const classSchema = new mongoose.Schema({
  schoolId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'School',
    required: true
  },
  teacherId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: false
  },
  grade: {
    type: String,
    required: true,
    enum: ['nursery', 'lkg', 'ukg', '1', '2', '3', '4', '5']
  },
  section: {
    type: String,
    required: false
  },
  year: {
    type: String,
    required: true
  },
  active: {
    type: Boolean,
    default: true
  },
  areas: [{
    area: {
      type: String,
      required: true,
      enum: [
        'physical',
        'socioEmotional',
        'cognitive',
        'language',
        'aesthetic',
        'positive',
        'languageR1',
        'languageR2',
        'maths',
        'worldAround',
        'artEd',
        'physicalEd'
      ]
    },
    medium: {
      type: String,
      required: true
    }
  }]
}, { timestamps: true });


classSchema.pre(/^find/, function (next) {
  // `this` refers to the current query
  this.where({ active: { $eq: true } });
  next();
});

module.exports = mongoose.model('Class', classSchema);
