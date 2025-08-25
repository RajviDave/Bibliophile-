import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailCTRL = TextEditingController();
  TextEditingController passwordCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "SignIn",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black12,
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            controller: emailCTRL,
            decoration: InputDecoration(
              hintText: 'Email',
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.email, color: Colors.black),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordCTRL,
            decoration: InputDecoration(
              hintText: 'password',
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 32),
          ElevatedButton(onPressed: () {}, child: Text("SignIn")),
        ],
      ),
    );
  }
}
