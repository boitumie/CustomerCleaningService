import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(CleaningCustomerApp());
}

class CleaningCustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleaning Customer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
