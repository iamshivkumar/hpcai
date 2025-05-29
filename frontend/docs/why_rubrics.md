Your question raises an important point about the role of rubrics in **summative assessments** in the context of K12 Indian schools, particularly under the **National Education Policy (NEP) 2020** and **National Curriculum Framework (NCF) 2023**. Let’s address your concerns by clarifying why rubrics are used in summative assessments, whether marks are considered, and whether NCF explicitly recommends rubrics for summative assessments. I’ll also revisit the **Mongoose model** for summative assessments to ensure it reflects the focus on marks while retaining rubrics as a complementary tool, as per your query.

### Clarifications on Summative Assessments, Marks, and Rubrics

1. **Are Marks Considered in Summative Assessments?**
   - **Yes**, marks (or grades) are a primary component of summative assessments. Summative assessments evaluate cumulative student learning at the end of a unit, term, or academic year, and their results typically contribute to final grades or certifications (NEP 2020, Section 4.35). For example, a term-end exam in Class 10 Mathematics might assign numerical marks (e.g., 80/100) based on question responses, which are used to calculate grades or report card scores.
   - In the Indian context (e.g., CBSE, ICSE, State Boards), summative assessments like board exams or annual exams heavily rely on marks to quantify student performance, ensuring alignment with standardized evaluation systems.

2. **Why Use Rubrics in Summative Assessments?**
   - **Purpose of Rubrics**: Rubrics provide a structured, transparent framework to evaluate complex tasks (e.g., projects, presentations, essays) where marks alone may not capture the full range of skills or competencies. They break down performance into specific criteria (e.g., "Content Accuracy," "Presentation Clarity") with defined levels (e.g., "Excellent," "Good") and associated scores, ensuring consistency and fairness.
   - **Role in Summative Assessments**: While marks are central, rubrics are often used for summative tasks that involve qualitative evaluation, such as:
     - **Projects**: Assessing research depth, creativity, and presentation quality.
     - **Presentations**: Evaluating communication skills, content, and delivery.
     - **Portfolios**: Judging a collection of student work over time.
     - For example, a Class 12 History project on "Indian Freedom Struggle" might allocate 20 marks, with a rubric assigning 10 marks for "Research Quality" and 10 for "Presentation," each with clear criteria.
   - **Complementary to Marks**: Rubrics translate qualitative performance into numerical scores, contributing to the total marks. For instance, a rubric level "Excellent (5)" for a criterion directly adds to the assessment’s total marks, ensuring marks remain the focus while rubrics provide granularity.
   - **NEP Alignment**: NEP 2020 emphasizes holistic, competency-based assessment (Section 4.35), encouraging tools like rubrics to assess skills beyond rote memorization (e.g., critical thinking, communication). Rubrics support this by providing detailed feedback and aligning with NCF’s competency framework.

3. **Does NCF 2023 Recommend Rubrics for Summative Assessments?**
   - **NCF 2023 Guidance**: The **National Curriculum Framework for School Education (NCF-SE) 2023** explicitly supports the use of rubrics for both formative and summative assessments, particularly to align with competency-based education. According to NCF 2023 (Chapter 4, Assessment), assessments should:
     - Focus on competencies (e.g., critical thinking, problem-solving) across all stages (Foundational, Preparatory, Middle, Secondary).
     - Use diverse tools, including rubrics, to evaluate complex tasks like projects, presentations, and practicals, which are common in summative assessments.
     - Ensure transparency and fairness through structured criteria, which rubrics provide.
   - **Specific Evidence**: NCF 2023 recommends "descriptive indicators" and "rubrics" for assessing competencies in summative contexts, especially for subjects like Science, Social Science, and Arts Education, where projects or performance-based tasks are integral (NCF-SE 2023, Section 4.3.2). For example, it suggests rubrics for evaluating "application of concepts" in a Science project or "historical analysis" in a Social Science presentation.
   - **Not Mandatory for All Summative Assessments**: While NCF encourages rubrics for tasks requiring qualitative evaluation, traditional written exams (e.g., Class 10 CBSE Math board exams) primarily use mark-based scoring (e.g., 2 marks per question). Rubrics are optional and typically applied to non-exam summative tasks like projects or practicals.
   - **Conclusion**: NCF 2023 does recommend rubrics for summative assessments where appropriate (e.g., projects, presentations), but marks remain the primary metric for grading, especially in standardized exams. Rubrics complement marks by providing a structured way to assign them for complex tasks.

4. **Why Retain Rubrics in the Mongoose Model?**
   - The **SummativeAssessmentSchema** includes a `rubric` field to support assessments like projects or presentations, where qualitative criteria are needed. For example, a Class 10 Science project might use a rubric to allocate 20 marks across criteria like "Experiment Design" and "Data Analysis."
   - For written exams, where marks are directly assigned per question, the `rubric` field can be optional or unused, with `questionsOrTasks.maxMarks` and `totalMarks` driving the scoring.
   - The schema’s flexibility allows teachers to use rubrics for relevant summative tasks while relying on marks for all assessments, ensuring alignment with both NCF’s recommendations and traditional board requirements.

### Updated Mongoose Model for Summative Assessments
To address your concern about emphasizing marks while retaining rubrics as a complementary tool, I’ll refine the **SummativeAssessmentSchema** to:
- Reinforce marks as the primary scoring mechanism via `questionsOrTasks.maxMarks` and `totalMarks`.
- Make rubrics optional, applicable only to assessment types like projects or presentations.
- Add a field to indicate whether rubrics are used for scoring, ensuring clarity for mark-based exams.

```javascript
const mongoose = require('mongoose');

const SummativeAssessmentSchema = new mongoose.Schema({
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
    match: [/^Class\s\d{1,2}-[A-Z]$/, 'Invalid class and section format (e.g., Class 10-B)'],
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
    min: [30, 'Duration must be at least 30 minutes'],
    max: [180, 'Duration cannot exceed 180 minutes'],
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
      values: ['Written Exam', 'Project', 'Presentation', 'Portfolio'],
      message: '{VALUE} is not a valid assessment type',
    },
  },
  isRubricBased: {
    type: Boolean,
    default: false, // Set to true for projects/presentations, false for written exams
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
        values: ['Critical Thinking', 'Scientific Thinking', 'Communication', 'Collaboration', 'Mathematical Reasoning', 'Problem Solving', 'Other'],
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
        values: ['Multiple-Choice', 'Short-Answer', 'Long-Answer', 'Performance-Based'],
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
      required: [true, 'Marks are required for summative assessment'],
      min: [1, 'Marks must be at least 1'],
    },
  }],
  rubric: {
    criteria: [{
      criterion: {
        type: String,
        trim: true,
        maxlength: [100, 'Criterion cannot exceed 100 characters'],
        required: function() { return this.parent().parent().isRubricBased; },
      },
      levels: [{
        level: {
          type: String,
          trim: true,
          maxlength: [50, 'Level cannot exceed 50 characters'],
          required: function() { return this.parent().parent().parent().isRubricBased; },
        },
        description: {
          type: String,
          trim: true,
          maxlength: [200, 'Level description cannot exceed 200 characters'],
          required: function() { return this.parent().parent().parent().isRubricBased; },
        },
        score: {
          type: Number,
          min: [0, 'Score cannot be negative'],
          required: function() { return this.parent().parent().parent().isRubricBased; },
        },
      }],
    }],
    required: function() { return this.isRubricBased; },
  },
  rubricEvaluations: [{
    studentId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Student',
      required: [true, 'Student ID is required'],
    },
    evaluatedBy: {
      type: String,
      required: [true, 'Evaluator type is required'],
      enum: {
        values: ['Teacher', 'Student', 'Peer'],
        message: '{VALUE} is not a valid evaluator type',
      },
    },
    evaluatorId: {
      type: mongoose.Schema.Types.ObjectId,
      refPath: 'rubricEvaluations.evaluatedBy',
      required: [true, 'Evaluator ID is required'],
    },
    criterionScores: [{
      criterion: {
        type: String,
        required: [true, 'Criterion is required'],
        trim: true,
        maxlength: [100, 'Criterion cannot exceed 100 characters'],
      },
      level: {
        type: String,
        required: [true, 'Performance level is required'],
        trim: true,
        maxlength: [50, 'Level cannot exceed 50 characters'],
      },
      score: {
        type: Number,
        required: [true, 'Score is required'],
        min: [0, 'Score cannot be negative'],
      },
      comments: {
        type: String,
        trim: true,
        maxlength: [200, 'Comments cannot exceed 200 characters'],
      },
    }],
    evaluationDate: {
      type: Date,
      default: Date.now,
    },
  }],
  totalMarks: {
    type: Number,
    required: [true, 'Total marks are required'],
    min: [1, 'Total marks must be at least 1'],
  },
  gradingCriteria: {
    type: String,
    trim: true,
    maxlength: [500, 'Grading criteria cannot exceed 500 characters'],
    default: 'Based on question marks allocation or rubric scores',
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
SummativeAssessmentSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

// Validate totalMarks against sum of question marks or rubric scores
SummativeAssessmentSchema.pre('save', function(next) {
  let total = 0;
  if (this.isRubricBased) {
    this.rubric.criteria.forEach(criterion => {
      const maxScore = Math.max(...criterion.levels.map(level => level.score));
      total += maxScore;
    });
  } else {
    total = this.questionsOrTasks.reduce((sum, q) => sum + q.maxMarks, 0);
  }
  if (total !== this.totalMarks) {
    return next(new Error('Total marks must equal the sum of question marks or rubric scores'));
  }
  next();
});

// Validate rubric evaluations
SummativeAssessmentSchema.pre('save', function(next) {
  if (this.isRubricBased && this.rubricEvaluations && this.rubricEvaluations.length > 0) {
    this.rubricEvaluations.forEach(evaluation => {
      evaluation.criterionScores.forEach(score => {
        const criterion = this.rubric.criteria.find(c => c.criterion === score.criterion);
        if (!criterion) {
          return next(new Error(`Invalid criterion: ${score.criterion}`));
        }
        const level = criterion.levels.find(l => l.level === score.level && l.score === score.score);
        if (!level) {
          return next(new Error(`Invalid level or score for criterion: ${score.criterion}`));
        }
      });
    });
  }
  next();
});

module.exports = mongoose.model('SummativeAssessment', SummativeAssessmentSchema);
```

### Changes in the Updated Mongoose Model
1. **Added `isRubricBased` Field**:
   - A boolean field to indicate whether the assessment uses rubrics (e.g., true for projects/presentations, false for written exams).
   - Makes `rubric` and its subfields (`criteria`, `levels`) conditional, required only if `isRubricBased` is true.

2. **Retained Marks as Primary**:
   - `questionsOrTasks.maxMarks` and `totalMarks` are mandatory, ensuring marks are the core scoring mechanism.
   - For non-rubric-based assessments (e.g., written exams), `totalMarks` is validated against the sum of `questionsOrTasks.maxMarks`.
   - For rubric-based assessments, `totalMarks` is validated against the sum of maximum rubric scores.

3. **Rubric Evaluations**:
   - Added `rubricEvaluations` (from your previous request) to store teacher-filled rubric scores per student, with support for student/peer evaluations (optional).
   - Validated to ensure consistency with the defined rubric (if `isRubricBased` is true).

4. **Grading Criteria**:
   - Updated `gradingCriteria` default to reflect both mark-based and rubric-based scoring options.

### Why Rubrics and Marks Coexist
- **Marks for Standardization**: Marks provide a numerical, standardized measure for grading, essential for board exams and report cards in Indian schools.
- **Rubrics for Complex Tasks**: Rubrics are critical for summative assessments like projects or presentations, where qualitative aspects (e.g., creativity, communication) need structured evaluation. They convert qualitative performance into marks, ensuring alignment with the grading system.
- **NCF 2023 Support**: NCF recommends rubrics for tasks requiring competency-based evaluation (e.g., projects in Science or Social Science), ensuring fairness and transparency while contributing to the total marks.

### App Implementation for Rubrics and Marks
- **Teacher Workflow**:
  - **Create Assessment**: Teachers select `type` (e.g., Written Exam, Project) and set `isRubricBased`. For written exams, they input `questionsOrTasks` with `maxMarks`. For projects/presentations, they define `rubric` criteria and levels.
  - **Fill Rubric (if applicable)**: For rubric-based assessments, teachers select a student, assign scores per criterion (e.g., "Content: Excellent (10)"), and save to `rubricEvaluations`.
  - **Assign Marks**: For non-rubric-based assessments, teachers directly assign marks per question/task, stored in a separate `studentResponses` model (not shown but can be added).
  - **Feedback**: Add comments in `feedback` or `rubricEvaluations.criterionScores.comments`.
- **UI Features**:
  - Form with toggle for `isRubricBased` to show/hide rubric fields.
  - Dropdowns for rubric criteria/levels and input for marks per question.
  - Dashboard to view/edit evaluations, with filters for class, subject, or student.
- **Analytics**:
  - Generate mark-based reports (e.g., total marks distribution) and rubric-based analytics (e.g., average scores per competency).

### Example Usage
```javascript
// Written Exam (non-rubric-based)
const exam = new SummativeAssessment({
  schoolName: 'Sunrise Public School, Mumbai',
  teacherId: '507f1f77bcf86cd799439011',
  subject: 'Mathematics',
  classAndSection: 'Class 10-B',
  topic: 'Quadratic Equations',
  date: new Date('2025-05-20'),
  duration: 120,
  academicYear: '2025-26',
  board: 'CBSE',
  type: 'Written Exam',
  isRubricBased: false,
  learningOutcomes: [{ description: 'Students will solve quadratic equations using multiple methods' }],
  competencies: [{ name: 'Mathematical Reasoning', description: 'Apply formulas accurately' }],
  questionsOrTasks: [
    { questionText: 'Solve x² - 5x + 6 = 0', questionType: 'Short-Answer', maxMarks: 5 },
    { questionText: 'What is the quadratic formula?', questionType: 'Multiple-Choice', options: ['a', 'b', 'c', 'd'], maxMarks: 2 },
  ],
  totalMarks: 7,
});
await exam.save();

// Project (rubric-based)
const project = new SummativeAssessment({
  schoolName: 'Sunrise Public School, Mumbai',
  teacherId: '507f1f77bcf86cd799439011',
  subject: 'Science',
  classAndSection: 'Class 10-B',
  topic: 'Water Cycle Project',
  date: new Date('2025-05-20'),
  duration: 120,
  academicYear: '2025-26',
  board: 'CBSE',
  type: 'Project',
  isRubricBased: true,
  learningOutcomes: [{ description: 'Students will explain the water cycle stages' }],
  competencies: [{ name: 'Scientific Thinking', description: 'Analyze processes' }],
  questionsOrTasks: [
    { questionText: 'Create a model of the water cycle', questionType: 'Performance-Based', maxMarks: 20 },
  ],
  rubric: {
    criteria: [
      {
        criterion: 'Model Accuracy',
        levels: [
          { level: 'Excellent', description: 'Accurate and detailed model', score: 10 },
          { level: 'Good', description: 'Mostly accurate with minor errors', score: 7 },
        ],
      },
      {
        criterion: 'Explanation',
        levels: [
          { level: 'Excellent', description: 'Clear and comprehensive', score: 10 },
          { level: 'Good', description: 'Clear but lacks detail', score: 7 },
        ],
      },
    ],
  },
  totalMarks: 20,
  rubricEvaluations: [
    {
      studentId: '507f1f77bcf86cd799439012',
      evaluatedBy: 'Teacher',
      evaluatorId: '507f1f77bcf86cd799439011',
      criterionScores: [
        { criterion: 'Model Accuracy', level: 'Excellent', score: 10, comments: 'Detailed model' },
        { criterion: 'Explanation', level: 'Good', score: 7, comments: 'Needs more detail' },
      ],
    },
  ],
});
await project.save();
```

### Confirmation of NCF Recommendation
To confirm, **NCF 2023** (Chapter 4, Section 4.3.2) explicitly recommends rubrics for summative assessments involving complex tasks (e.g., projects, presentations) to ensure competency-based evaluation. For traditional written exams, marks are prioritized, but rubrics can still be used for components like long-answer questions or practicals (e.g., Science lab work). The updated model supports both approaches, making rubrics optional to accommodate diverse summative assessment types.

If you need further clarification, API endpoints for CRUD operations, a frontend form for rubric/mark entry, or integration with the formative assessment model, let me know!