import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register/Screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to the Lazywear.my Home Screen'),
            const Text('You have logged in Successfuly'),
            const SizedBox(height: 50),
            SizedBox(
              height: 60,
              width: 150,
              child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  child: const Center(
                    child: Text('Log out'),
                  ),
                  onPressed: () async {
                    await _signOut();
                    if (_firebaseAuth.currentUser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}