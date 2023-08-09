import 'package:flutter/material.dart';
import 'package:loan27/profile/profile_page.dart';
import 'package:loan27/signin.dart';
import 'homePage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 176, 164, 242),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 2) {
            // If the user taps on the "LOGOUT" button (index 2), show the logout confirmation dialog
            _showLogoutConfirmationDialog();
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: Colors.red),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person, color: Colors.red),
            label: "PROFILE",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            activeIcon: Icon(Icons.logout, color: Colors.red),
            label: "LOGOUT",
          ),
        ],
      ),
      body: getBodyWidget(),
    );
  }

  // Function to show the logout confirmation dialog
  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signin(),
                  ),
                );

                setState(() {
                  _currentIndex = 0; // Navigate to the Home page
                });
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  getBodyWidget() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      // case 1:
      //   return UserDetailsPage();
      case 1:
        return ProfilePage();
      default:
        return Container();
    }
  }
}
