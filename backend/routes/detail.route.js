const { request } = require('express')
const express = require('express')
const Personal = require('../models/personal.model')
const Edu = require('../models/edu.model')
const Business = require('../models/business.model')
const Gold = require('../models/gold.model')
const House = require('../models/house.model')
const Vehicle = require('../models/vehicle.model')
    //const axios = require('axios')
const router = express.Router()





// async function validateAadhaarUsingKarza(res, aadhaarNumber) {
//     try {
//         const headers = {
//             'content-type': 'application/json',
//             'x-karza-key': 'bfj5uRl4yhgmc3zQH38L', // Replace with your Karza API key
//         };

//         const body = {
//             aadhaarNo: aadhaarNumber,
//             consent: 'Y',
//         };

//         const response = await axios.post('https://testapi.karza.in/v3/aadhaar-xml/otp', body, {
//             headers: headers,
//         });

//         //console.log(response.data); // You can check the response data from the Karza API here

//         return response.data;
//     } catch (error) {
//         console.log("In catch block 1")
//         console.log(error)
//         return res.status("Something went wrong Aadhar")
//             // console.error(error);
//             // throw error;
//     }
// }

// // Function to validate PAN using Karza API
// async function validatePanUsingKarza(res, panNumber) {
//     try {
//         const headers = {
//             'content-type': 'application/json',
//             'x-karza-key': 'bfj5uRl4yhgmc3zQH38L', // Replace with your Karza API key
//         };

//         const body = {
//             pan: panNumber,
//             consent: 'Y',
//             clientData: {
//                 caseID: Math.random()
//             }
//         };

//         const response = await axios.post('https://testapi.karza.in/v2/pan', body, {
//             headers: headers,
//         });

//         //console.log(response.data); // You can check the response data from the Karza API here

//         return response.data;
//     } catch (error) {
//         console.log("error block 2")
//         console.log(error)
//         return res.status("Something went wrong")
//             // console.error(error);
//             // throw error;
//     }
// }






// router.post('/personal', async(req, res) => {
//     try {
//         const user1 = await Detail.find({
//             panCardNo: req.body.panCardNo
//         });
//         const user = await Detail.find({
//             aadhaarCardNo: req.body.aadhaarCardNo
//         });

//         if (user.length > 0 && user1.length > 0) {
//             res.status(400).send({ statusCode: 400, message: 'Pan card no and Aadhar both already used' });
//             return;
//         } else if (user1.length > 0 || user.length > 0) {
//             res.status(400).send({ statusCode: 400, message: 'Pan card no or aadhar no is already used' });
//             return;
//         } else {
//             // Validate name
//             const nameRegex = /^[a-zA-Z\s]+$/;
//             if (!req.body.name || !nameRegex.test(req.body.name)) {
//                 res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' });
//                 return;
//             }

//             // Validate phone number
//             const phoneRegex = /^\d{10}$/;
//             if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
//                 res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' });
//                 return;
//             }

//             // Validate income
//             if (req.body.income && req.body.income < 100000) {
//                 res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' });
//                 return;
//             }

//             // Validate Aadhaar and PAN using Karza API
//             const aadhaarValidationResult = await validateAadhaarUsingKarza(res, req.body.aadhaarCardNo);
//             const panValidationResult = await validatePanUsingKarza(res, req.body.panCardNo);
//             // console.log("3642573263825678")

//             //console.log("result", aadhaarValidationResult.data);
//             console.log("result", panValidationResult);
//             //console.log("3642573263825678")

//             if (!aadhaarValidationResult.status || !panValidationResult.status) {
//                 res.status(400).send({ statusCode: 400, message: 'Invalid Aadhaar or PAN card number' });
//                 return;
//             }

//             // Save the user details
//             const newUser = new Detail({
//                 name: req.body.name,
//                 phoneNo: req.body.phoneNo,
//                 panCardNo: req.body.panCardNo,
//                 aadhaarCardNo: req.body.aadhaarCardNo,
//                 gender: req.body.gender,
//                 occupation: req.body.occupation,
//                 income: req.body.income
//             });

//             const savedUser = await newUser.save();
//             res.status(200).send({ statusCode: 200, message: savedUser });
//         }
//     } catch (err) {
//         console.log(err);
//         res.status(500).json(err);
//     }
// });







router.post('/personal', async(req, res) => {
    try {
        console.log("14")
        const user1 = await Personal.find({
            panCardNo: req.body.panCardNo
        })
        const user = await Personal.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In personal API")
        console.log(req.body)
        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name 
            console.log("33 else")
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            console.log("40 else")
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            console.log("47 else")
            if (req.body.income && req.body.income < 100000) {
                res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
                return
            }
            const newUser = new Personal({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                //dob: req.body.dob,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                occupation: req.body.occupation,
                income: req.body.income
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})

router.post('/education', async(req, res) => {
    try {
        console.log("14")
        const user1 = await Edu.find({
            panCardNo: req.body.panCardNo
        })
        const user = await Edu.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In education API")
        console.log(req.body)
        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name
            console.log("33 else")
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            console.log("40 else")
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            // if (req.body.income && req.body.income < 100000) {
            //     res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
            //     return
            // }
            const newUser = new Edu({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                //dob: req.body.dob,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                qualification: req.body.qualification
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})

router.post('/gold', async(req, res) => {
    try {
        console.log("14")
        const user1 = await Gold.find({
            panCardNo: req.body.panCardNo
        })
        const user = await Gold.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In gold API")
        console.log(req.body)
        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name 
            console.log("33 else")
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            console.log("40 else")
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            console.log("47 else")
            if (req.body.income && req.body.income < 100000) {
                res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
                return
            }
            const newUser = new Gold({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                //dob: req.body.dob,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                occupation: req.body.occupation,
                income: req.body.income
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})

router.post('/vehicle', async(req, res) => {
    try {
        const user1 = await Vehicle.find({
            panCardNo: req.body.panCardNo
        })
        const user = await Vehicle.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In Vehicle API")

        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            if (req.body.income && req.body.income < 100000) {
                res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
                return
            }
            const newUser = new Vehicle({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                //dob: req.body.dob,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                occupation: req.body.occupation,
                vehicletype: req.body.vehicletype,
                model: req.body.model,
                income: req.body.income
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})

router.post('/house', async(req, res) => {
    try {
        const user1 = await House.find({
            panCardNo: req.body.panCardNo
        })
        const user = await House.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In house API")

        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            if (req.body.income && req.body.income < 100000) {
                res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
                return
            }
            const newUser = new House({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                occupation: req.body.occupation,
                address: req.body.address,
                propertytype: req.body.propertystatus,
                propertystatus: req.body.propertystatus,
                income: req.body.income
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
})


router.post('/business', async(req, res) => {
    try {
        console.log("14")
        const user1 = await Business.find({
            panCardNo: req.body.panCardNo
        })
        const user = await Business.find({
            aadhaarCardNo: req.body.aadhaarCardNo
        })
        console.log("In business API")
        console.log(req.body)
        if (user.length > 0 && user1.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no and aadhar both already used' })
            return
        } else if (user1.length > 0 || user.length > 0) {
            console.log(user.length)
            res.status(400).send({ statusCode: 400, message: 'pan card no or aadhar both already used' })
            return
        } else {
            // Validate name
            console.log("33 else")
            const nameRegex = /^[a-zA-Z]+$/;
            if (!req.body.name || !nameRegex.test(req.body.name)) {
                res.status(400).send({ statusCode: 400, message: 'Name should have only alphabets' })
                return
            }
            // Validate phone number
            console.log("40 else")
            const phoneRegex = /^\d{10}$/;
            if (!req.body.phoneNo || !phoneRegex.test(req.body.phoneNo)) {
                res.status(400).send({ statusCode: 400, message: 'Phone number must be only 10 digits' })
                return
            }
            // Validate income
            console.log("47 else")
            if (req.body.income && req.body.income < 100000) {
                res.status(400).send({ statusCode: 400, message: 'Income should be greater than or equal to 1 lakh' })
                return
            }
            const newUser = new Business({
                name: req.body.name,
                phoneNo: req.body.phoneNo,
                dob: req.body.dob,
                panCardNo: req.body.panCardNo,
                aadhaarCardNo: req.body.aadhaarCardNo,
                gender: req.body.gender,
                companytype: req.body.companytype,
                income: req.body.income
            })
            const savedUser = await newUser.save()
            res.status(200).send({ statusCode: 200, message: savedUser })
        }



    } catch (err) {
        console.log(err)
        res.status(500).json(err)
    }
});



module.exports = router