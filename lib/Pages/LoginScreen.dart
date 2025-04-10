import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/background.png', fit: BoxFit.cover),

          // Dark Overlay
          Container(color: Colors.black.withOpacity(0.85)),

          // UI content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back button
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),

                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ), // replace with your logo
                const SizedBox(height: 10),
                const Text(
                  "TrackIt",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Please Login To Your Account",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialButton(icon: Icons.g_mobiledata),
                    const SizedBox(width: 16),
                    socialButton(icon: Icons.facebook),
                    const SizedBox(width: 16),
                    socialButton(icon: Icons.apple),
                  ],
                ),
                const SizedBox(height: 20),

                const Text("or", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),

                // Email field
                textField(hint: "Enter Your Email", icon: Icons.email),
                const SizedBox(height: 20),

                // Password field
                textField(
                  hint: "Enter Your Password",
                  icon: Icons.lock,
                  obscure: true,
                ),

                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Login button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Login", style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget socialButton({required IconData icon}) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey.shade900,
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget textField({
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.redAccent),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
