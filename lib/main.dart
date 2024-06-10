import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
import 'screens/signup_page.dart';
import 'screens/signin_page.dart';
import 'screens/drivers_page.dart';
import 'screens/tour_guides_page.dart';
import 'screens/flights_page.dart';
import 'screens/hotels_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDFmUwopMksVlxM1-drOWV0nrhKZHL6k1U",
      authDomain: "travelapp-659ed.firebaseapp.com",
      projectId: "travelapp-659ed",
      storageBucket: "travelapp-659ed.appspot.com",
      messagingSenderId: "320497916953",
      appId: "1:320497916953:web:cbb7772da8830a05649e88",
      measurementId: "G-F4C41SDLR8", // Note: This is optional and can be omitted if not needed
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: SignInPage(),
      routes: {
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => SignInPage(),
        '/home': (context) => HomePage(),
        '/drivers': (context) => DriversPage(),
        '/tourGuides': (context) => TourGuidesPage(),
        '/flights': (context) => FlightsPage(),
        '/hotels': (context) => HotelsPage(),
      },
    );
  }
}
