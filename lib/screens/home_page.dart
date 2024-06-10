import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../gradient_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Travel App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/drivers');
                },
                child: Text('Drivers'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tourGuides');
                },
                child: Text('Tour Guides'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/flights');
                },
                child: Text('Flights'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/hotels');
                },
                child: Text('Hotels'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
