import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:loan27/homePage.dart';
import 'package:loan27/mainPage.dart';
import 'package:loan27/user.dart';
import 'package:loan27/signup.dart';
import 'package:http/http.dart' as http;
//import 'package:loan27/dashboard.dart';
import 'package:localstorage/localstorage.dart';

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

  final LocalStorage storage =
      LocalStorage('user_details'); // Initialize local storage

  User user = User('', ''); // Move the User object here

  // Function to save user details in local storage
  Future<void> saveToLocal(String email) async {
    await storage.ready;
    await storage.setItem('email', email);
  }

  Future<String?> getStoredEmail() async {
    await storage.ready;
    return storage.getItem('email');
  }

  Future<void> save() async {
    var url = Uri.parse("http://10.0.2.2:8383/signin");
    var res = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'email': user.email, 'password': user.password},
      ),
    );

    switch (res.statusCode) {
      case 200:
        saveToLocal(user.email);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage()), // Update this line
        );
        break;
      case 401:
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid email or password'),
              actions: <Widget>[
                FloatingActionButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        break;
      default:
        // handle any unhandled status codes
        break;
    }
  }

  void checkLocalStorage() async {
    await storage.ready;
    String? storedEmail = storage.getItem('email');
    if (storedEmail != null) {
      print('Email is stored in the local storage: $storedEmail');
      setState(() {
        user.email = storedEmail;
      });
    } else {
      print('Email is not stored in the local storage.');
    }
  }

  void handleSignIn() {
    if (_formKey.currentState!.validate()) {
      saveToLocal(user.email); // Save to local storage
      save(); // Send to backend
    } else {
      print("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Positioned(
        //     top: 0,
        //     child: SvgPicture.asset(
        //       'images/top.svg',
        //       width: 400,
        //       height: 150,
        //     )),
        Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'images/simpli.png',
                        height: 200,
                        width: 400,
                      ),
                      Text(
                        "Signin",
                        style: GoogleFonts.pacifico(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.deepPurple.shade900),
                      ),
                      // Rest of the code
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.email),
                      onChanged: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something';
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return 'Enter valid email';
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.deepPurple.shade900,
                          ),
                          hintText: 'Enter Email',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: TextEditingController(text: user.password),
                      onChanged: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter something';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.deepPurple.shade900,
                          ),
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple.shade900))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                    child: Container(
                      height: 50,
                      width: 300,
                      child: FloatingActionButton(
                          backgroundColor: Colors.deepPurple.shade900,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // added null check operator ! after currentState
                              save();
                            } else {
                              print("not ok");
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            "        Not have Account ? ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.deepPurple.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "\n\n\n\n\n\n\n  \n\t\t\t\t\tSimplyFI Softech India Pvt. Ltd.\u00a9",
                      style: GoogleFonts.roboto(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Colors.deepPurple.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
