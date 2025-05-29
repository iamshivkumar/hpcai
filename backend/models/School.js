const mongoose = require('mongoose');

const schoolSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  logo: {
    type: String,
    trim: true,
    default: null, // Optional field for logo URL or file path
  },
  address: {
    type: String,
    required: true,
    trim: true,
  },
  udise: {
    type: String,
    required: true,
    unique: true,
    trim: true,
  },
  board: {
    type: String, // e.g., "CBSE", "ICSE", etc.
    default: "CBSE"
  },

  ownerId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User', // References the User model
    required: true,
  },
  active: {
    type: Boolean,
    default: true,
  },
}, {
  timestamps: true, // Adds createdAt and updatedAt fields
});

const School = mongoose.model('School', schoolSchema);

module.exports = School;