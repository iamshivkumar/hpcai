const mongoose = require('mongoose');

const FormativeAssessmentSchema = new mongoose.Schema({
  schoolName: {
    type: String,
    required: [true, 'School name is required'],
    trim: true,
    maxlength: [100, 'School name cannot exceed 100 characters'],
  },
  teacherId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Teacher',
    required: [true, 'Teacher ID is required'],
  },
  subject: {
    type: String,
    required: [true, 'Subject is required'],
    trim: true,
    enum: {
      values: ['Mathematics', 'Science', 'English', 'Social Science', 'Hindi', 'Other'],
      message: '{VALUE} is not a valid subject',
    },
  },
  classAndSection: {
    type: String,
    required: [true, 'Class and section are required'],
    trim: true,
    match: [/^Class\s\d{1,2}-[A-Z]$/, 'Invalid class and section format (e.g., Class 6-A)'],
  },
  topic: {
    type: String,
    required: [true, 'Topic is required'],
    trim: true,
    maxlength: [100, 'Topic cannot exceed 100 characters'],
  },
  date: {
    type: Date,
    required: [true, 'Date is required'],
    default: Date.now,
  },
  duration: {
    type: Number,
    required: [true, 'Duration is required'],
    min: [1, 'Duration must be at least 1 minute'],
    max: [60, 'Duration cannot exceed 60 minutes'],
  },
  academicYear: {
    type: String,
    required: [true, 'Academic year is required'],
    match: [/^\d{4}-\d{2}$/, 'Invalid academic year format (e.g., 2025-26)'],
  },
  board: {
    type: String,
    enum: ['CBSE', 'ICSE', 'State Board', 'Other'],
    default: 'CBSE',
  },
  type: {
    type: String,
    required: [true, 'Assessment type is required'],
    enum: {
      values: ['Quiz', 'Observation', 'Group Activity', 'Worksheet', 'Oral Response', 'Reflective Task'],
      message: '{VALUE} is not a valid assessment type',
    },
  },
  learningOutcomes: [{
    description: {
      type: String,
      required: [true, 'Learning outcome description is required'],
      trim: true,
      maxlength: [200, 'Learning outcome cannot exceed 200 characters'],
    },
  }],
  competencies: [{
    name: {
      type: String,
      required: [true, 'Competency name is required'],
      trim: true,
      enum: {
        values: ['Critical Thinking', 'Scientific Thinking', 'Communication', 'Collaboration', 'Mathematical Reasoning', 'Other'],
        message: '{VALUE} is not a valid competency',
      },
    },
    description: {
      type: String,
      trim: true,
      maxlength: [200, 'Competency description cannot exceed 200 characters'],
    },
  }],
  questionsOrTasks: [{
    questionText: {
      type: String,
      required: [true, 'Question or task text is required'],
      trim: true,
      maxlength: [500, 'Question or task cannot exceed 500 characters'],
    },
    questionType: {
      type: String,
      required: [true, 'Question type is required'],
      enum: {
        values: ['Open-Ended', 'Multiple-Choice', 'Performance-Based'],
        message: '{VALUE} is not a valid question type',
      },
    },
    options: [{
      type: String,
      trim: true,
      maxlength: [100, 'Option cannot exceed 100 characters'],
      required: function() { return this.questionType === 'Multiple-Choice'; },
    }],
    maxMarks: {
      type: Number,
      min: [0, 'Marks cannot be negative'],
      default: 0,
    },
  }],
  rubric: {
    criteria: [{
      criterion: {
        type: String,
        required: [true, 'Rubric criterion is required'],
        trim: true,
        maxlength: [100, 'Criterion cannot exceed 100 characters'],
      },
      levels: [{
        level: {
          type: String,
          required: [true, 'Performance level is required'],
          trim: true,
          maxlength: [50, 'Level cannot exceed 50 characters'],
        },
        description: {
          type: String,
          required: [true, 'Level description is required'],
          trim: true,
          maxlength: [200, 'Level description cannot exceed 200 characters'],
        },
        score: {
          type: Number,
          required: [true, 'Score is required'],
          min: [0, 'Score cannot be negative'],
        },
      }],
    }],
  },
  feedback: {
    type: String,
    trim: true,
    maxlength: [1000, 'Feedback cannot exceed 1000 characters'],
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  updatedAt: {
    type: Date,
    default: Date.now,
  },
});

// Update timestamp on save
FormativeAssessmentSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

module.exports = mongoose.model('FormativeAssessment', FormativeAssessmentSchema);