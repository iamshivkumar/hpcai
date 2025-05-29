# Documentation for Indian EdTech Platform: EduNCF

## 1. Overview
EduNCF is a cloud-based pedagogical platform designed to enhance active learning, streamline assessments, and support Holistic Progress Cards (HPCs) for Indian schools, aligning with NEP 2020 and NCF 2023. It replicates FeedbackFruits’ core functionalities—interactive learning, AI-driven feedback, and LMS integration—while catering to CBSE/ICSE curricula and DIKSHA integration.

### 1.1 Objectives
- Support competency-based education with customizable learning outcomes.
- Automate formative and summative assessments with AI-driven feedback.
- Generate HPCs incorporating teacher, peer, self, and parent inputs.
- Integrate with DIKSHA and other Indian LMS platforms.
- Empower teachers to design interactive activities and rubrics aligned with NCF 2023.

### 1.2 Target Audience
- **Teachers**: Create activities, rubrics, and HPCs.
- **Students**: Engage in interactive tasks and view feedback.
- **School Admins**: Manage users and monitor progress.
- **Parents** (future phase): Access read-only HPCs.

## 2. System Architecture
EduNCF uses a modular, scalable architecture to ensure reliability and ease of integration.

### 2.1 Technology Stack
- **Frontend**: React with Tailwind CSS for responsive UI.
- **Backend**: Node.js with Express for RESTful APIs.
- **Database**: MongoDB for flexible schema handling (HPCs, rubrics, etc.).
- **AI**: Python with Hugging Face Transformers for feedback and rubric generation.
- **Authentication**: JWT for secure access; OAuth for LMS integration.
- **Hosting**: AWS (EC2 for compute, S3 for file storage, RDS for backups).
- **LMS Integration**: API-based sync with DIKSHA, Google Classroom.

### 2.2 Architecture Diagram
```
[Users: Teachers, Students, Admins]
       |
[Frontend: React + Tailwind CSS]
       |
[Backend: Node.js + Express APIs]
       |________________________
       |                       |
[Database: MongoDB]    [AI Service: Python + Hugging Face]
       |                       |
[AWS: EC2, S3, RDS]   [LMS: DIKSHA, Google Classroom]
```

## 3. Core Features
EduNCF replicates FeedbackFruits’ key functionalities, tailored for Indian schools.

### 3.1 Teacher Dashboard
- **Functionality**: Create, manage, and assign activities, rubrics, and HPCs.
- **Features**:
  - Activity creation (quizzes, projects, discussions).
  - Rubric editor with NCF-aligned learning outcomes.
  - HPC generation with multi-source inputs (teacher, peer, self, parent).
  - Analytics for student progress and competency tracking.

### 3.2 Interactive Learning
- **Functionality**: Embed interactive elements in lessons.
- **Features**:
  - Live polls and discussion prompts.
  - Collaborative group tasks.
  - Real-time student engagement tracking.

### 3.3 Assessment Modules
- **Functionality**: Support formative and summative assessments.
- **Features**:
  - Peer review and self-assessment tools.
  - AI-generated feedback based on submissions.
  - Rubric-based grading aligned with NCF outcomes.
  - HPC integration for competency-based reporting.

### 3.4 AI Automation
- **Functionality**: Reduce teacher workload through automation.
- **Features**:
  - Generate rubrics from NCF learning outcomes.
  - Provide formative feedback on student submissions.
  - Suggest lesson plans based on curriculum standards.

### 3.5 LMS Integration
- **Functionality**: Seamless sync with DIKSHA and other platforms.
- **Features**:
  - OAuth-based authentication.
  - Sync student rosters, assignments, and grades.
  - Export HPCs to LMS for parent access.

### 3.6 Analytics and Reporting
- **Functionality**: Track student progress and generate reports.
- **Features**:
  - Visualize competency mastery (cognitive, socio-emotional, psychomotor).
  - Export HPCs as PDF reports.
  - Class-level and student-level analytics dashboards.

## 4. User Flows
### 4.1 Teacher Flow
1. **Login**: Authenticate via LMS or email/password.
2. **Onboarding**: Select curriculum (CBSE/ICSE), grade, and subjects; view NCF-aligned tutorials.
3. **Activity Creation**:
   - Choose activity type (e.g., quiz, project).
   - Select NCF learning outcomes.
   - Create or use AI-generated rubric.
   - Assign to students via LMS.
4. **Assessment**:
   - Review student submissions.
   - Input teacher feedback or approve AI-generated feedback.
   - Assign scores using rubrics.
5. **HPC Generation**:
   - Compile inputs (teacher, peer, self, parent).
   - Generate HPC with competency scores and comments.
   - Export to LMS or PDF.
6. **Analytics**: View student progress dashboards and adjust teaching plans.

### 4.2 Student Flow
1. **Login**: Access via LMS credentials.
2. **View Tasks**: See assigned activities (quizzes, projects, peer reviews).
3. **Submit Work**: Upload responses or participate in discussions.
4. **Receive Feedback**: View AI/teacher feedback and scores.
5. **Track Progress**: Access simplified HPC view (read-only).

### 4.3 Admin Flow
1. **Manage Users**: Add/remove teachers and students.
2. **Monitor Usage**: Track platform adoption and activity completion.
3. **Export Reports**: Generate school-wide HPC and analytics reports.

## 5. Database Schema
The schema supports HPCs, assessments, and NCF-aligned learning outcomes, building on your prior Mongoose schema request (May 20, 2025).

### 5.1 Mongoose Models
```javascript
const mongoose = require('mongoose');

// Teacher Schema
const TeacherSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  school: { type: String, required: true },
  subjects: [{ type: String }], // e.g., Math, Science
  createdAt: { type: Date, default: Date.now },
});

// Student Schema
const StudentSchema = new mongoose.Schema({
  name: { type: String, required: true },
  rollNumber: { type: String, required: true, unique: true },
  class: { type: String, required: true }, // e.g., Grade 5
  school: { type: String, required: true },
  parentEmail: { type: String },
});

// Learning Outcome Schema (NCF 2023-aligned)
const LearningOutcomeSchema = new mongoose.Schema({
  code: { type: String, required: true }, // e.g., MATH_G5_LO1
  description: { type: String, required: true },
  subject: { type: String, required: true },
  grade: { type: String, required: true },
  competency: { type: String, enum: ['Cognitive', 'Socio-Emotional', 'Psychomotor'] },
});

// Rubric Schema
const RubricSchema = new mongoose.Schema({
  title: { type: String, required: true },
  learningOutcome: { type: mongoose.Schema.Types.ObjectId, ref: 'LearningOutcome' },
  criteria: [{
    description: { type: String, required: true },
    levels: [{ level: String, score: Number, description: String }],
  }],
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'Teacher' },
  createdAt: { type: Date, default: Date.now },
});

// Activity Schema
const ActivitySchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String },
  type: { type: String, enum: ['Quiz', 'Project', 'Discussion', 'Peer Review'] },
  learningOutcomes: [{ type: mongoose.Schema.Types.ObjectId, ref: 'LearningOutcome' }],
  rubric: { type: mongoose.Schema.Types.ObjectId, ref: 'Rubric' },
  assignedTo: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Student' }],
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'Teacher' },
  dueDate: { type: Date },
  createdAt: { type: Date, default: Date.now },
});

// HPC Schema
const HPCSchema = new mongoose.Schema({
  student: { type: mongoose.Schema.Types.ObjectId, ref: 'Student' },
  academicYear: { type: String, required: true },
  competencies: [{
    learningOutcome: { type: mongoose.Schema.Types.ObjectId, ref: 'LearningOutcome' },
    score: { type: Number },
    feedback: { type: String },
    source: { type: String, enum: ['Teacher', 'Peer', 'Self', 'Parent'] },
  }],
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'Teacher' },
  createdAt: { type: Date, default: Date.now },
});

// Assessment Schema
const AssessmentSchema = new mongoose.Schema({
  title: { type: String, required: true },
  type: { type: String, enum: ['Formative', 'Summative'] },
  activity: { type: mongoose.Schema.Types.ObjectId, ref: 'Activity' },
  student: { type: mongoose.Schema.Types.ObjectId, ref: 'Student' },
  submission: { type: String }, // URL or text for student work
  feedback: { type: String }, // AI-generated or teacher-provided
  score: { type: Number },
  rubric: { type: mongoose.Schema.Types.ObjectId, ref: 'Rubric' },
  createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'Teacher' },
  createdAt: { type: Date, default: Date.now },
});

module.exports = {
  Teacher: mongoose.model('Teacher', TeacherSchema),
  Student: mongoose.model('Student', StudentSchema),
  LearningOutcome: mongoose.model('LearningOutcome', LearningOutcomeSchema),
  Rubric: mongoose.model('Rubric', RubricSchema),
  Activity: mongoose.model('Activity', ActivitySchema),
  HPC: mongoose.model('HPC', HPCSchema),
  Assessment: mongoose.model('Assessment', AssessmentSchema),
};
```

## 6. API Endpoints
Key RESTful APIs to support the platform’s functionality.

### 6.1 Teacher APIs
- **POST /api/teachers**: Register a new teacher.
- **GET /api/teachers/:id**: Retrieve teacher profile.
- **PUT /api/teachers/:id**: Update teacher details.

### 6.2 Activity APIs
- **POST /api/activities**: Create an activity (quiz, project, etc.).
- **GET /api/activities/:id**: Retrieve activity details.
- **PUT /api/activities/:id**: Update activity settings.
- **POST /api/activities/:id/assign**: Assign activity to students.

### 6.3 Rubric APIs
- **POST /api/rubrics**: Create a rubric (manual or AI-generated).
- **GET /api/rubrics/:id**: Retrieve rubric details.
- **PUT /api/rubrics/:id**: Update rubric criteria.

### 6.4 HPC APIs
- **POST /api/hpcs**: Generate HPC for a student.
- **GET /api/hpcs/:studentId**: Retrieve student’s HPC.
- **PUT /api/hpcs/:id**: Update HPC with new inputs.

### 6.5 Assessment APIs
- **POST /api/assessments**: Submit student assessment.
- **GET /api/assessments/:id**: Retrieve assessment details.
- **POST /api/assessments/:id/feedback**: Add AI/teacher feedback.

## 7. AI Integration
- **Library**: Hugging Face Transformers (e.g., BERT for NLP tasks).
- **Use Cases**:
  - Generate rubrics based on NCF learning outcomes.
  - Provide formative feedback on student submissions.
  - Suggest lesson plans aligned with CBSE/ICSE curricula.
- **Implementation**:
  - Python microservice with Flask, hosted on AWS Lambda.
  - Input: Student submission text, learning outcome.
  - Output: Feedback text or rubric JSON.

## 8. LMS Integration
- **Platforms**: DIKSHA, Google Classroom.
- **Method**: OAuth 2.0 for authentication; REST APIs for data sync.
- **Data Synced**:
  - Student rosters.
  - Assignment details.
  - HPC and assessment results.

## 9. Implementation Plan
### 9.1 Phase 1: MVP (3-6 months)
- Develop teacher dashboard, activity creation, and HPC generation.
- Implement basic AI feedback (e.g., keyword-based scoring).
- Integrate with DIKSHA.
- Pilot with 2-3 CBSE schools.

### 9.2 Phase 2: Full Features (6-12 months)
- Add student and admin portals.
- Enhance AI with NLP for detailed feedback.
- Support ICSE and state board curricula.
- Scale to 10+ schools.

### 9.3 Phase 3: Expansion (12-18 months)
- Add parent portal for HPC access.
- Integrate with additional LMS platforms.
- Expand to 100+ schools with marketing campaigns.

## 10. Addressing Challenges
Based on your prior concern about CBSE school adoption (March 21, 2025):
- **Onboarding**: Include interactive tutorials highlighting NEP 2020 benefits.
- **Marketing**: Leverage X posts targeting Indian educators; partner with NCERT.
- **Awareness**: Offer free trials and workshops to demonstrate HPC and assessment ease.

## 11. Sample Onboarding Screen
- **Title**: Welcome to EduNCF: Empowering NEP 2020 Learning
- **Description**: Create HPCs, design NCF-aligned activities, and streamline assessments with AI support.
- **Action**: Select curriculum (CBSE/ICSE), grade, and start creating.

## 12. Security and Compliance
- **Authentication**: JWT for internal APIs; OAuth for LMS.
- **Data Privacy**: Comply with India’s DPDP Act 2023; encrypt student data.
- **Access Control**: Role-based access (teacher, student, admin).

## 13. Testing and Validation
- **Unit Tests**: Test APIs with Jest (backend) and React Testing Library (frontend).
- **Integration Tests**: Validate DIKSHA sync and AI feedback accuracy.
- **User Testing**: Pilot with teachers to ensure NCF alignment and usability.

## 14. Future Enhancements
- Mobile app for teacher and student access.
- Multilingual support (Hindi, Tamil, etc.) for inclusivity.
- Advanced analytics with predictive student performance models.