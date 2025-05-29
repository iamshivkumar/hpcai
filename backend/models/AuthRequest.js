const mongoose = require('mongoose');

     const authRequestSchema = new mongoose.Schema({
       phone: { type: String, required: true },
       otp: { type: String, required: true },
       createdAt: { type: Date, default: Date.now },
       expiresAt: { type: Date, required: true },
     });

     module.exports = mongoose.model('AuthRequest', authRequestSchema);