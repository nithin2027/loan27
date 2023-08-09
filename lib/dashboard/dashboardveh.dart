import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:loan27/private_sector/privateveh.dart';
import 'package:loan27/public_sector/publicveh.dart';
import 'dart:math' as math;

void main() {
  print(math.pi * 4);
}

class Dashboardveh extends StatefulWidget {
  @override
  State<Dashboardveh> createState() => _DashboardvehState();
}

class _DashboardvehState extends State<Dashboardveh> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Cards Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple.shade900,
          centerTitle: true,
          title: Text('TYPES OF BANK'),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        //backgroundColor: Colors.purple.shade800,
        body: AnimatedBackground(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (BuildContext context, VoidCallback _) {
                    return BankTablePageveh();
                  },
                  closedElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  closedColor: Colors.transparent,
                  closedBuilder:
                      (BuildContext context, VoidCallback openContainer) {
                    return GestureDetector(
                      onTap: openContainer,
                      child: Container(
                        width: 220,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color.fromARGB(255, 66, 53, 170)),
                        alignment: Alignment.center,
                        child: Text(
                          'PUBLIC SECTOR BANK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (BuildContext context, VoidCallback _) {
                    return BankTablePageve();
                  },
                  closedElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  closedColor: Colors.transparent,
                  closedBuilder:
                      (BuildContext context, VoidCallback openContainer) {
                    return GestureDetector(
                      onTap: openContainer,
                      child: Container(
                        width: 220,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color.fromARGB(255, 128, 44, 213),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'PRIVATE SECTOR BANK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  AnimatedBackground({required this.child});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 55, 5, 64),
            Color.fromARGB(255, 14, 3, 77)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      child: widget.child,
    );
  }
}
