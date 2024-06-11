import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF3A818B),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              height: 150,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Medical Community',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9FCAD7),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'We take care of your health',
                          style: TextStyle(
                            fontSize: 27,
                            color: Color(0xFF9FCAD7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A818B),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF3A818B),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.person,
                            size: 30, color: Color(0xFF9FCAD7)),
                      ),
                      SizedBox(width: 50),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF3A818B),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.local_hospital,
                            size: 25, color: Color(0xFF9FCAD7)),
                      ),
                      SizedBox(width: 60),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF3A818B),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.favorite,
                            size: 30, color: Color(0xFF9FCAD7)),
                      ),
                      SizedBox(width: 60),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF3A818B),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Icon(Icons.medical_services,
                            size: 30, color: Color(0xFF9FCAD7)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Image.asset(
                        'images/Rectangle 29.png',
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Get the Best Medical Services We provide the best quality medical services without further cost',
                                style: TextStyle(
                                  color: Color(0xFF1c9679),
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(width: 26),
                            Image.asset(
                              'images/doctor.png',
                              width: 100,
                              height: 100,
                              // Adjust width and height according to your needs
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Additional content: Overview and Approach
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A818B),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Provide a brief overview of your medical services and approach.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1c9679),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Approach',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A818B),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Explain your approach to providing quality healthcare services.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1c9679),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
