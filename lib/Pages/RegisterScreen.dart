import 'package:athlete_360/Firebase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreen_RegisterScreenState();
}

class RegisterScreen_RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleSignup() async {
    final email = emailController.text;
    final password = passwordController.text;
    // Call your authentication service here
    await AuthService().playerSignUp(email, password);

    await Future.delayed(const Duration(seconds: 2));
    context.pop();
    print("Email: $email");
    print("Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/background.png', fit: BoxFit.cover),

          // Dark overlay
          Container(color: Colors.black.withOpacity(0.85)),

          // Main Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Logo
                Center(
                  child: Image.asset('assets/images/logo.png', height: 120),
                ),
                const SizedBox(height: 10),

                const Text(
                  "Register!! To get started",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Social Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialButton(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 16),
                    socialButton(
                      icon: FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 16),
                    socialButton(
                      icon: FontAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const Text("or", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),

                //Name
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Name",
                    icon: Icons.account_circle_outlined,
                    controller: nameController,
                  ),
                ),

                const SizedBox(height: 20),

                // Email
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                ),

                const SizedBox(height: 20),

                // Password
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Password",
                    icon: Icons.lock,
                    controller: passwordController,
                    obscure: true,
                  ),
                ),

                const SizedBox(height: 20),

                // // Forgot Password
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: const Text(
                //       "Forget Password?",
                //       style: TextStyle(color: Colors.redAccent),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 10),

                // Register Button
                ElevatedButton(
                  onPressed: handleSignup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

                // Register Link
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text(
                //       "Don’t Have Account? ",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     GestureDetector(
                //       onTap: () {},
                //       child: const Text(
                //         "Register",
                //         style: TextStyle(color: Colors.red),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Widget socialButton({required IconData icon, required Color color}) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey.shade900,
      child: FaIcon(icon, color: color),
    );
  }

  Widget textField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.redAccent),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}
