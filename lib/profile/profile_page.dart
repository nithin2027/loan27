import 'package:flutter/material.dart';
// import 'package:loan27/profile/edit_profile.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import 'package:localstorage/localstorage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LocalStorage storage = LocalStorage('user_details');
  String userEmail = ''; // Holds the user's email fetched from the backend API

  // Function to fetch the user's email from the backend API
  Future<void> fetchUserEmail() async {
    await storage.ready;

    // Wait for a short period before fetching the email to give it some time to load.
    await Future.delayed(Duration(milliseconds: 100));

    String email = storage.getItem('email') ?? '';
    setState(() {
      userEmail = email;
    });
    print('User email from local storage: $userEmail');
  }

  @override
  void initState() {
    super.initState();
    print('ProfilePage - initState called');
    fetchUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade900,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('MY PROFILE')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://e0.pxfuel.com/wallpapers/173/720/desktop-wallpaper-night-view-neon-moon-purple.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 32),
              GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => EditProfilePage()),
                //   );
                // },
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      'https://w7.pngwing.com/pngs/589/83/png-transparent-account-avatar-contact-people-profile-user-basic-icon.png'),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EditProfilePage()),
                  // );
                },
                child: Text(
                  userEmail, // Display the user's email here
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                '+91 7975703893',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 32),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => EditProfilePage()),
              //         );
              //       },
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all<Color>(
              //           Colors.deepPurpleAccent.shade700,
              //         ),
              //         minimumSize: MaterialStateProperty.all<Size>(
              //           Size(double.infinity, 50),
              //         ),
              //       ),
              //       child: Text('Edit Profile'),
              //     ),
              //     SizedBox(height: 16)
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
