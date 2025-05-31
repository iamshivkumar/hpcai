const mongoose = require('mongoose');

const activitySchema = new mongoose.Schema({
  schoolId: {
          type: mongoose.Schema.Types.ObjectId,
          ref: 'School',
          required: false
      },
  grade: { type: String, required: true },
  area: { type: String, required: true },
  medium: { type: String },
  title: { type: String, required: true },
  description: { type: String, required: true },
  questions: { type: [String], default: null },
  pedagogies: { type: [String], default: null },
  goals: { type: [String], default: [] },
  competencies: { type: [String], default: [] },
  rubric: {
    type: Map,
    of: {
      type: Map,
      of: String,
    },
    default: {},
  },
  active: { type: Boolean, default: true },
  createdBy: { type: String, required: true },
  updatedBy: { type: String, default: null }
},{ timestamps: true });


activitySchema.pre(/^find/, function (next) {
  // `this` refers to the current query
  this.where({ active: { $eq: true } });
  next();
});


// Create the model
const Activity = mongoose.model('Activity', activitySchema);

// ✅ Export both
module.exports = {
  Activity,
  activitySchema,
};