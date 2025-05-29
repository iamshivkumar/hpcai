// models/LessonPlan.js
const mongoose = require('mongoose');

const LessonPlanSchema = new mongoose.Schema({
  schoolId: { type: mongoose.Schema.Types.ObjectId, ref: 'School', required: true },
  teacherId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  subject: { type: String, required: true },
  class: { type: String, required: true }, // e.g., "Class 6-A"
  topic: { type: String, required: true },
  duration: { type: Number, required: true },
  academicYear: { type: String, required: true }, // e.g., "2025-26"
  board: { type: String, required: true }, // e.g., "CBSE"
  ncfStage: { type: String, required: true }, // e.g., "Middle Stage"

  learningGoals: { type: [String], required: true },
  learningOutcomes: { type: [String], required: true },
  competencies: { type: [String], required: true },
  prerequisiteSkills: { type: [String] },
  resources: { type: [String] },

  instructionalStrategies: [
    {
      timeMinutes: Number,
      description: String
    }
  ],

  assessment: {
    formative: { type: [String] },
    summative: { type: [String] }
  },

  differentiation: {
    generalStrategies: [String],
    multilingualSupport: [String],
    specialNeedsSupport: [String]
  },

  homework: {
    description: String,
    dueDate: Date
  },

  remarks: { type: String },

  metadata: {
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now }
  },

  status: {
    type: String,
    enum: ['draft', 'submitted', 'approved', 'rejected'],
    default: 'draft'
  },

  approvals: {
    hodId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    principalId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    approvedAt: Date
  },

  branding: {
    logoUrl: { type: String },
    footerNote: { type: String }
  }
});

LessonPlanSchema.pre('save', function (next) {
  this.metadata.updatedAt = new Date();
  next();
});

module.exports = mongoose.model('LessonPlan', LessonPlanSchema);
