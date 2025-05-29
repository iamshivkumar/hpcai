require('dotenv').config();

     module.exports = {
       port: process.env.PORT || 8080,
       nodeEnv: process.env.NODE_ENV || 'development',
       testPhoneNumbers: ['1234567890', '9876543210', '5555555555'],
     };