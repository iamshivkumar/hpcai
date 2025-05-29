const crypto = require('crypto');

     const generateOTP = (length = 6) => {
       const digits = '0123456789';
       let otp = '';
       for (let i = 0; i < length; i++) {
         otp += digits[Math.floor(Math.random() * digits.length)];
       }
       return otp;
     };

     const generateSecretToken = (length = 32) => {
       return crypto.randomBytes(length).toString('base64');
     };

     module.exports = { generateOTP, generateSecretToken };