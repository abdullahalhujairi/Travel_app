import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../gradient_background.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String userType = 'Default User'; // Default user type

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (value) => value?.isEmpty ?? true ? 'Enter an email' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (value) => (value?.length ?? 0) < 6 ? 'Enter a 6+ char password' : null,
                ),
                DropdownButtonFormField(
                  value: userType,
                  items: ['Default User', 'Driver', 'Tour Guide', 'Agency'].map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      userType = value as String;
                    });
                  },
                  decoration: InputDecoration(labelText: 'User Type'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email, password: password);
                        // Save user type in your database
                        // Navigate to the home screen
                        Navigator.pushReplacementNamed(context, '/home');
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text('Sign Up'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  child: Text('Already have an account? Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
