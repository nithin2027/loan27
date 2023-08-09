import 'package:flutter/material.dart';
import 'mainPage.dart';

class ProcessingPage extends StatefulWidget {
  @override
  _ProcessingPageState createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade900,
        centerTitle: true,
        title: Text('LOAN CONFIRMATION'),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 253, 253, 255),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/processing.png',
                height: 200,
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                'YOUR APPLICATION HAS BEEN SENT FOR PROCESSING',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'THANK YOU FOR CHOOSING SIMPLYFUND.',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Go to Home Page'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade900,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'CONTACT DETAILS :\n+91 9183721371\nXYZ@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
