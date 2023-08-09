// import 'package:flutter/material.dart';

// class NavPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MainStat();
//   }
// }

// class _MainStat extends State<MainPage> {
//   int _currentIndex = 0;



// class NavigationBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.deepPurple.shade900,
//         centerTitle: true,
//         title: Text("SIMPLIFUNDS"),
//       ),
//       backgroundColor: Colors.deepPurple.shade100,
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "HOME",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.stairs_sharp),
//             label: "PROGRESS",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "PROFILE",
//           ),
//         ],
//       ),
//       body: getBodyWidget(),
//     );
//   }
// }
