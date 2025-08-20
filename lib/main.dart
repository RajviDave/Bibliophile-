import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(BibliophileApp());
}

class BibliophileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bibliophile',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}
