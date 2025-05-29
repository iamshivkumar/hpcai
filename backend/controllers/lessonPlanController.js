const LessonPlan = require('../models/LessonPlan');

// GET /lesson-plans?area=Numeracy&medium=English&grade=3
const listLessonPlans = async (req, res) => {
  try {
    const { schoolId, area, medium, grade } = req.query;
    const filter = {};

    if (schoolId) filter['schoolId'] = schoolId;
    if (area) filter['area'] = area;
    if (medium) filter['medium'] = medium;
    if (grade) filter['grade'] = parseInt(grade);

    const lessonPlans = await LessonPlan.find(filter).sort({ createdAt: -1 });
    res.json(lessonPlans);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch lesson plans' });
  }
};

// POST /lesson-plans
const createLessonPlan = async (req, res) => {
  try {
    const userId = req.user.id || req.body.createdBy; // Optional: from auth middleware or direct

    const lessonPlanData = {
      ...req.body,
      createdBy: userId,
      updatedBy: userId,
    };

    const newLessonPlan = await LessonPlan.create(lessonPlanData);
    res.status(201).json(newLessonPlan);
  } catch (err) {
    res.status(400).json({ error: 'Failed to create lesson plan', details: err.message });
  }
};

// PUT /lesson-plans/:id
const updateLessonPlan = async (req, res) => {
    try {
      const { id } = req.params;
      const userId = req.user.id;
  
      const updateFields = {
        ...req.body,
        updatedBy: userId,
      };
  
      delete updateFields._id; // Prevent accidental overwrite
  
      const updatedPlan = await LessonPlan.findByIdAndUpdate(
        id,
        { $set: updateFields },
        { new: true }
      );
  
      if (!updatedPlan) {
        return res.status(404).json({ error: 'Lesson plan not found' });
      }
  
      res.json(updatedPlan);
    } catch (err) {
      res.status(400).json({ error: 'Failed to update lesson plan', details: err.message });
    }
  };
  

// GET /lesson-plans/:id
const getLessonPlanById = async (req, res) => {
  try {
    const plan = await LessonPlan.findById(req.params.id);
    if (!plan) return res.status(404).json({ error: 'Lesson plan not found' });
    res.json(plan);
  } catch (err) {
    res.status(400).json({ error: 'Invalid lesson plan ID' });
  }
};

// DELETE /lesson-plans/:id
const deleteLessonPlan = async (req, res) => {
  try {
    const deleted = await LessonPlan.findByIdAndDelete(req.params.id);
    if (!deleted) return res.status(404).json({ error: 'Lesson plan not found' });
    res.json({ message: 'Lesson plan deleted successfully' });
  } catch (err) {
    res.status(400).json({ error: 'Failed to delete lesson plan' });
  }
};


module.exports = {listLessonPlans, deleteLessonPlan, getLessonPlanById, updateLessonPlan, createLessonPlan }