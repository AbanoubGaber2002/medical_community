import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Home.dart';
import 'package:my_flutter_app/ask_me.dart';
import 'package:my_flutter_app/about_us.dart';
import 'package:my_flutter_app/Profile.dart';
import 'package:my_flutter_app/Welcome_Screen.dart';
import 'package:my_flutter_app/registration_screen.dart';
import 'package:my_flutter_app/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyBi5yEKYaZg5vwPqoVka32uHuTaqSlpJX0",
            appId: "1:109992796342:android:8e657957f892bdc4d5c617",
            messagingSenderId: "109992796342",
            projectId: "medical-community-c4b5c",
          ),
        )
      : await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Community',
      color: Color(0xFF3A818B),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF9FCAD7),
          selectedItemColor: Color(0xFF9FCAD7),
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SigninScreen.screenRoute: (context) => SigninScreen(),
        RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    AskMe(),
    AboutUs(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Community'),
       
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Ask Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
