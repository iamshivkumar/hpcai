const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    schoolId: { type: mongoose.Schema.Types.ObjectId, required: false },
    name: { type: String, default: '' },
    phone: { type: String, required: true, unique: true },
    role: {
        type: String,
        enum: ['admin', 'teacher', 'system'],
        default: 'admin',
    },
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model('User', userSchema);