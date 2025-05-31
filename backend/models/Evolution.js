const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define the Evolution schema
const evolutionSchema = new Schema({
    schoolId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'School',
        required: true
    },
    classId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Class',
        required: true
    },
    assessmentId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Assessment',
        required: true
    },
    studentId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Student',
        required: true
    },
    data: {
        type: Map,
        of: Schema.Types.Mixed, // Allows any data type in the map
        default: {},
    },

    createdBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    updatedBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        default: null
    },
      active: {
    type: Boolean,
    default: true
  }
}
);


evolutionSchema.pre(/^find/, function (next) {
    // `this` refers to the current query
    this.where({ active: { $eq: true } });
    next();
});

// Create and export the Mongoose model
const Evolution = mongoose.model('Evolution', evolutionSchema);

module.exports = Evolution;