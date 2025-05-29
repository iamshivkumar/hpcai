const Session = require('../models/Session');
const User = require('../models/User');

const verifyToken = () => async (req, res, next) => {
    const token = req.headers.authorization;
    if (!token) {
        return res.status(401).json({ error: 'Authorization header required' });
    }

    const session = await Session.findOne({ secretToken: token });
    if (!session) {
        return res.status(401).json({ error: 'Invalid or expired session' });
    }

    if (session.expiresAt < new Date()) {
        return res.status(401).json({ error: 'Session expired' });
    }

    const user = await User.findById(session.userId);
    if (!user) {
        return res.status(401).json({ error: 'User not found' });
    }

    req.sessionId = session._id.toHexString();

    req.user = {
        id: session.userId.toHexString(),
        role: session.role,
    };
    next();
};


module.exports = { verifyToken };