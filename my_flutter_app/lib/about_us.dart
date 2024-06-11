// lib/AboutUs.dart
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Who we are',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3A818B),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'We Help To Get You Well',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF3A818B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'images/picAboutUs.png',
              width: 300,
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Welcome to Medical Community - Empowering Life with Celiac Freedom. We understand the challenges of managing celiac disease and aim to empower individuals on their gluten-free journey with resources, community support, and innovative tools.',

                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF3A818B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
