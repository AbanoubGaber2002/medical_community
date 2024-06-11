import 'package:flutter/material.dart';
import 'package:my_flutter_app/my_button.dart';
import 'package:my_flutter_app/registration_screen.dart';
import 'package:my_flutter_app/signin_screen.dart';




class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  get images => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/th.png'),
                ),
                Text(
                  'Medical community',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF3A818B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
                 color: Color(0xFF3A818B),
              title: 'Sign in',
              onPressed: () {
                Navigator.pushNamed(context, SigninScreen.screenRoute);
              },
            ),
            MyButton(
                  color: Color(0xFF3A818B),
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
