const mongoose = require('mongoose')
const Schema = mongoose.Schema
    // const moment = require('moment');

const newSchema = new mongoose.Schema({
    name: { type: String, required: true },
    phoneNo: { type: String, required: true },
    panCardNo: { type: String, required: true },
    aadhaarCardNo: { type: String, required: true },
    gender: { type: String, required: true },
    companytype: { type: String, required: true },
    income: { type: Number, required: true }
});

module.exports = mongoose.model('Business', newSchema)