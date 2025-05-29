const User = require('../models/User');

     const updateUser = async (req, res) => {
       try {
         const { name } = req.body;
         if (!name) {
           return res.status(400).json({ error: 'Invalid input' });
         }

         const user = await User.findById(req.user.id);
         if (!user) {
           return res.status(404).json({ error: 'User not found' });
         }

         if (req.user.id !== user._id.toHexString()) {
           return res.status(403).json({ error: 'Unauthorized to edit this user' });
         }

         user.name = name;
         user.updatedAt = new Date();
         await user.save();

         res.status(200).json({ message: 'User updated successfully' });
       } catch (error) {
         res.status(400).json({ error: error.message });
       }
     };

     module.exports = { updateUser };