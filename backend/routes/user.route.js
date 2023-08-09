const { request } = require('express')
const express = require('express')
const User = require('../models/user.model')
const router = express.Router()

router.post('/signup', async(req, res) => {
    try {
        const user = await User.find({ email: req.body.email })
        console.log("In sign up API")
        console.log(req.body)
        if (user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'User exists' })
            return
        } else {
            const newUser = new User({ email: req.body.email, password: req.body.password })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }


    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})

router.post('/signin', async(req, res) => {
    try {
        console.log("In sign in API");
        console.log(req.body);
        const user = await User.findOne({ email: req.body.email, password: req.body.password });
        console.log(user);
        if (!user) {
            res.status(401).json({ message: 'Invalid email or password' });
            return;
        }
        res.status(200).json(user);
    } catch (err) {
        console.log(err);
        res.status(500).json(err);
    }
});


router.get('/profile/:email', async(req, res) => {
    try {
        console.log("in get api function");
        const email = req.params.email;
        console.log(req.params)
            // console.log(req.query); // Assuming the email is provided as a query parameter
        const user = await User.findOne({ email: email });
        console.log(user);
        if (!user) {
            return res.status(404).json({ message: 'User not found' });
        }

        res.status(200).json({ email: user.email }); // Return the user's email
    } catch (err) {
        console.log(err);
        res.status(500).json({ message: 'Internal server error' });
    }
});



module.exports = router