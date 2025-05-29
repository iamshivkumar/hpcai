const AuthRequest = require('../models/AuthRequest');
const User = require('../models/User');
const Session = require('../models/Session');
const { generateSecretToken } = require('../utils/crypto');
const config = require('../config/config');

const sendOTP = async (req, res) => {
    try {
        const { phone } = req.body;
        if (!phone) {
            return res.status(400).json({ error: 'Invalid input' });
        }

        // if (!config.testPhoneNumbers.includes(phone)) {
        //     return res.status(400).json({ error: 'Invalid test phone number' });
        // }

        const otp = '123456'; // Fixed for testing
        const expiresAt = new Date(Date.now() + 5 * 60 * 1000);

        const authRequest = new AuthRequest({
            phone,
            otp,
            expiresAt,
        });

        await authRequest.save();
        console.log(`OTP for ${phone}: ${otp}`); // Replace with SMS gateway in production

        res.status(200).send(authRequest._id.toHexString());
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

const verifyOTP = async (req, res) => {
    try {
        const { requestId, otp } = req.body;
        if (!requestId || !otp) {
            return res.status(400).json({ error: 'Invalid input' });
        }

        const authRequest = await AuthRequest.findById(requestId);
        if (!authRequest) {
            return res.status(401).json({ error: 'invalid request ID' });
        }

        if (authRequest.expiresAt < new Date()) {
            return res.status(401).json({ error: 'OTP expired' });
        }

        if (authRequest.otp !== otp) {
            return res.status(401).json({ error: 'invalid OTP' });
        }

        await AuthRequest.deleteOne({ _id: requestId });

        let user = await User.findOne({ phone: authRequest.phone });
        const now = new Date();
        if (!user) {
            user = new User({
                phone: authRequest.phone,
                role: 'admin',
                createdAt: now,
                updatedAt: now,
            });
            await user.save();
        }

        const secretToken = generateSecretToken();
        const session = new Session({
            userId: user._id,
            secretToken,
            role: user.role,
            expiresAt: new Date(Date.now() + 24 * 60 * 60 * 1000),
        });
        await session.save();


        res.status(200).json({
            id: user._id.toHexString(),
            schoolId: user.schoolId.toHexString(),
            name: user.name,
            phone: user.phone,
            role: user.role,
            token: secretToken,
            createdAt: user.createdAt,
            updatedAt: user.updatedAt,
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = { sendOTP, verifyOTP };