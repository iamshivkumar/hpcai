const mongoose = require('mongoose');

const checklistSchema = new mongoose.Schema({
  schoolId: { type: String, required: true },
  classId: { type: String, required: true },
  key: { type: String, required: true }, // e.g. "Checklist-Term1-Eng"
  area: { type: String, default: null },
  term: { type: String, default: null },
  medium: { type: String, required: true },
  title: { type: String, required: true },
  goals: { type: [String], default: [] },
  competencies: { type: [String], default: [] },
  items: {
    type: Map,
    of: String,
    default: {},
  },
  createdBy: { type: String, required: true },
  updatedBy: { type: String, default: null },
  active: { type: Boolean, default: true },
}, { timestamps: true });


checklistSchema.pre(/^find/, function (next) {
    // `this` refers to the current query
    this.where({ active: { $eq: true } });
    next();
});

module.exports = mongoose.model('Checklist', checklistSchema);
