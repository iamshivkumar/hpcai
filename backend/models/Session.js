const mongoose = require('mongoose');

     const sessionSchema = new mongoose.Schema({
       userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
       secretToken: { type: String, required: true },
       schoolId: String,
       role: {
         type: String,
         enum: ['admin', 'teacher', 'system'],
         required: true,
       },
       createdAt: { type: Date, default: Date.now },
       expiresAt: { type: Date, required: true },
     });

     module.exports = mongoose.model('Session', sessionSchema);