import 'package:flutter/material.dart';
import 'signup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // ✅ Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // ✅ Always dispose controllers to free memory
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // For now just print
    print("Email: $email, Password: $password");

    // Later: add your backend auth logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                const Text(
                  "SignIn",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Email field
                TextField(
                  controller: emailController, // ✅ added controller
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),

                // Password field
                TextField(
                  controller: passwordController, // ✅ added controller
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 30),

                // Sign In button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _signIn, // ✅ function
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
