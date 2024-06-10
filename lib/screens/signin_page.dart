import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../gradient_background.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
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
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushReplacementNamed(context, '/home');
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                  child: Text('Sign In'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
