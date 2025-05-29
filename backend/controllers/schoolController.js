const School = require('../models/School');
const User = require('../models/User');
const Session = require('../models/Session');

// POST: Create a new school
const createSchool = async (req, res) => {
    try {
        const createdSchool = await School.create(req.body);

        // Update user's schoolId
        await User.updateOne(
            { _id: req.user.id },
            { $set: { schoolId: createdSchool._id } }
        );

        // Update session's schoolId
        await Session.updateOne(
            { sessionId: req.sessionId },
            { $set: { schoolId: createdSchool._id.toHexString() } }
        );

        res.status(201).json(createdSchool);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// PATCH: Update an existing school
const updateSchool = async (req, res) => {
    try {
        const { id } = req.params;

        // Remove restricted keys from req.body
        const { active, ownerId, ...sanitizedBody } = req.body;

        const updatedSchool = await School.findByIdAndUpdate(
            id,
            { $set: sanitizedBody },
            { new: true, runValidators: true }
        );

        if (!updatedSchool) {
            return res.status(404).json({ error: 'School not found' });
        }

        res.status(200).json(updatedSchool);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

// GET: Retrieve school by ID
const getSchoolById = async (req, res) => {
    try {
        const { id } = req.params;

        const school = await School.findById(id);

        if (!school) {
            return res.status(404).json({ error: 'School not found' });
        }

        res.status(200).json(school);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};


module.exports = { createSchool, updateSchool, getSchoolById };