import 'package:flutter/material.dart';
import 'package:loan27/loanformdetail/business.dart';
import 'package:loan27/loanformdetail/edu.dart';
import 'package:loan27/loanformdetail/gold.dart';
import 'package:loan27/loanformdetail/house.dart';
import 'package:loan27/loanformdetail/personal.dart';
import 'package:loan27/loanformdetail/vehicle.dart';
//import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> services = [
    "PERSONAL LOAN",
    "BUSINESS LOAN",
    "EDUCATION LOAN",
    "HOUSING LOAN",
    "VEHICLE LOAN",
    "GOLD LOAN"
  ];

  final List<String> images = [
    "images/personal.png",
    "images/bussiness.png",
    "images/education.png",
    "images/housing.png",
    "images/vehicle.png",
    "images/gold.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('TYPES OF LOAN'),
      ),
      backgroundColor: Color.fromARGB(255, 22, 8, 67),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StackedCardCarousel(
                items: [
                  for (int i = 0; i < services.length; i++)
                    GestureDetector(
                      onTap: () => _navigateToPage(context, i),
                      child: Hero(
                        tag: images[i],
                        child: Card(
                          elevation: 100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                images[i],
                                fit: BoxFit.cover,
                                height: 280,
                                width: 300, // Increased card height
                              ),
                              Text(
                                services[i],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
                type: StackedCardCarouselType.fadeOutStack,
                initialOffset: 40.0,
                spaceBetweenItems: 400,
                applyTextScaleFactor: true,
                pageController: _defaultPageController,
                onPageChanged: (pageIndex) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage2(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage3(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage4(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage5(),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsPage6(),
          ),
        );
        break;
      default:
        // Handle other cases or show an error message.
        break;
    }
  }
}

enum MyStackedCardCarouselType {
  cardsStack,
  fadeOutStack,
}

final PageController _defaultPageController = PageController();

typedef OnPageChanged = void Function(int pageIndex);
