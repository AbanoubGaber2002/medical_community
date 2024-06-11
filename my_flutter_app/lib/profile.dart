import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late User? currentUser;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    currentUser = _auth.currentUser;
    if (currentUser != null) {
      await getUserData();
    }
    setState(() {});
  }

  Future<void> getUserData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DocumentSnapshot doc = await _firestore.collection('users').doc(currentUser!.uid).get();
    userData = doc.data() as Map<String, dynamic>?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentUser != null && userData != null
          ? Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                            color: Color(0xFF3A818B),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('images/profile.jpeg'),
                              ),
                              Text(
                                userData!['fullName'] ?? 'No Name',
                                style: TextStyle(
                                  color: Color(0xFF9FCAD7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: Icon(Icons.email),
                          title: Text(
                            'Email',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            currentUser!.email ?? 'No Email',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            'Full Name',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            userData!['fullName'] ?? 'No Name',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.cake),
                          title: Text(
                            'Age',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            userData!['age'] ?? 'No Age',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.transgender),
                          title: Text(
                            'Gender',
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            userData!['gender'] ?? 'No Gender',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        // Add more ListTile widgets for other user information if needed
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
