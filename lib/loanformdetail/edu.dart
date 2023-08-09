import 'package:flutter/material.dart';
import 'package:loan27/dashboard/dashboardedu.dart';
import 'package:loan27/details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserDetailsPage3 extends StatefulWidget {
  UserDetailsPage3({Key? key}) : super(key: key);

  @override
  _UserDetailsPage3State createState() => _UserDetailsPage3State();
}

class _UserDetailsPage3State extends State<UserDetailsPage3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _phoneNo;
  //DateTime? _dob;
  String? _panCardNo;
  String? _aadhaarCardNo;
  String? _gender;
  String? _qualification;
  //int? _income;

  final List<String> _genderList = ['Male', 'Female', 'Other'];
  final List<String> _qualificationList = [
    'Graduate',
    'Post-Graduate',
    'Diploma',
    'Matriculate',
    'Others'
  ];

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null && picked != _dob) {
  //     setState(() {
  //       _dob = picked;
  //     });
  //   }
  // }
  Future<void> save() async {
    var url = Uri.parse("http://10.0.2.2:8383/education");
    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'name': _name,
          'phoneNo': _phoneNo,
          'panCardNo': _panCardNo,
          'aadhaarCardNo': _aadhaarCardNo,
          'gender': _gender,
          'qualification': _qualification
        },
      ),
    );
    print('Response status code: ${res.statusCode}');
  }

  // Separate variable for income
  Edu edu = Edu('', '', '', '', '', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('STUDENT DETAILS'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return 'Enter a valid name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    } else if (value.length != 10) {
                      return 'Phone number should have exactly 10 digits';
                    } else if (!RegExp(r"^[6-9]\d{9}$").hasMatch(value)) {
                      return 'Phone number does not belong to this region/country';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _phoneNo = value;
                  },
                ),
                // SizedBox(height: 16.0),
                // InkWell(
                //   onTap: () {
                //     _selectDate(context);
                //   },
                //   child: IgnorePointer(
                //     child: TextFormField(
                //       decoration: InputDecoration(
                //         labelText: 'Date of Birth',
                //         suffixIcon: Icon(Icons.calendar_today),
                //       ),
                //       validator: (String? value) {
                //         if (value == null || value.isEmpty) {
                //           return 'date of birth is required';
                //         }
                //         return null;
                //       },
                //       onSaved: (String? value) {
                //         // Since this field is read-only, there's no need to save the value
                //       },
                //       controller: TextEditingController(
                //         text: _dob != null
                //             ? "${_dob!.day}/${_dob!.month}/${_dob!.year}"
                //             : "",
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'PAN Card Number'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'PAN Card Number is required';
                    } else if (value.length != 10) {
                      return 'PAN Card Number should be 10 characters long';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _panCardNo = value;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Aadhaar Card Number'),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Aadhar number is required';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Aadhar number should contain only digits';
                    } else if (value.length != 12) {
                      return 'Aadhar number should have exactly 12 digits';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _aadhaarCardNo = value;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Gender'),
                  value: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  items: _genderList.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'gender is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _gender = value;
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Qualification'),
                  value: _qualification,
                  onChanged: (String? value) {
                    setState(() {
                      _qualification = value!;
                    });
                  },
                  items: _qualificationList.map((String occupation) {
                    return DropdownMenuItem<String>(
                      value: occupation,
                      child: Text(occupation),
                    );
                  }).toList(),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'occupation is required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    _qualification = value;
                  },
                ),
                SizedBox(height: 16.0),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Income'),
                //   keyboardType: TextInputType.number,
                //   validator: (String? value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Income is required';
                //     }
                //     int income = int.tryParse(value) ?? 0;
                //     if (income < 100000) {
                //       return 'Income must be greater than 1 lakh';
                //     }
                //     return null;
                //   },
                //   onSaved: (String? value) {
                //     if (value != null) {
                //       _income = int.tryParse(value) ?? 0;
                //     }
                //   },
                // ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple
                        .shade900, // Replace 'Colors.blue' with your desired color
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _formKey.currentState?.save();
                      _showDialog();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _selectDate2(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime.now());
  //   if (picked != null && picked != _dob) {
  //     setState(() {
  //       _dob = picked;
  //     });
  //   }
  // }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Education Loan Details'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: $_name'),
                SizedBox(height: 8.0),
                Text('Phone Number: $_phoneNo'),
                SizedBox(height: 8.0),
                // Text(
                //     'Date of Birth: ${_dob?.day}/${_dob?.month}/${_dob?.year}'),
                // SizedBox(height: 8.0),
                Text('PAN Card Number: $_panCardNo'),
                SizedBox(height: 8.0),
                Text('Aadhaar Card Number: $_aadhaarCardNo'),
                SizedBox(height: 8.0),
                Text('Gender: $_gender'),
                SizedBox(height: 8.0),
                Text('qualification: $_qualification'),
                SizedBox(height: 8.0),
                // Text('INCOME Status: $_income'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('PROCEED'),
                onPressed: () {
                  _formKey.currentState?.save(); // Save the form fields
                  save(); // Send the user details to the backend
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboardedu(),
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
}
