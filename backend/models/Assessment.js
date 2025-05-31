const mongoose = require('mongoose');

const assessmentSchema = new mongoose.Schema({
    schoolId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'School',
        required: true
    },
    classId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Class',
        default: null
    },
    type: {
        type: String,
        required: true
    },
    term: String,
    name: {
        type: String,
        required: true
    },
    activityId:  {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Activity',
        required: false
    },
    activity: {
        type: Map,
        of: mongoose.Schema.Types.Mixed,
        default: null
    },

    groupId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Group',
        required: false
    },

    studentId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Student',
        required: false
    },


    //   final String? studentId;
    sections: {
        type: [Map], // Flexible structure per section
        default: [],
    },
    area: {
        type: String,
        default: null
    },
    medium: {
        type: String,
        default: null
    },
    active: { type: Boolean, default: true },
    createdBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    updatedBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        default: null
    }
}, { timestamps: true });



assessmentSchema.pre(/^find/, function (next) {
    // `this` refers to the current query
    this.where({ active: { $eq: true } });
    next();
});

module.exports = mongoose.model('Assessment', assessmentSchema);
