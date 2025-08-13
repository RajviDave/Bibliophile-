import 'package:flutter/material.dart';
import 'package:flutter_udemy/loginpage.dart'; // <-- make sure the path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: LoginPage(), // <-- set your login page here
    );
  }
}
