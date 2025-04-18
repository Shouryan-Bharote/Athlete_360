import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreen_RegisterScreenState();
}

class RegisterScreen_RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ageController =
      TextEditingController(); // Changed to ageController
  final TextEditingController additionalInfoController =
      TextEditingController();

  String selectedSport = 'Cricket'; // Default sport

  void handleLogin() {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final location = locationController.text;
    final age = ageController.text;
    final additionalInfo = additionalInfoController.text;
    final sport = selectedSport;

    print("Name: $name");
    print("Email: $email");
    print("Password: $password");
    print("Location: $location");
    print("Age: $age");
    print("Additional Info: $additionalInfo");
    print("Sport: $sport");
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    locationController.dispose();
    ageController.dispose();
    additionalInfoController.dispose();
    super.dispose();
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
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.arrow_back, color: Colors.white),
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

                const Text("or", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),

                // Name Field
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Name",
                    icon: Icons.account_circle_outlined,
                    controller: nameController,
                  ),
                ),
                const SizedBox(height: 20),

                // Email Field
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 20),

                // Password Field
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

                // Location Field
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Location",
                    icon: Icons.location_on,
                    controller: locationController,
                  ),
                ),
                const SizedBox(height: 20),

                // Age Field (Text Field for Age Input)
                SizedBox(
                  height: 58,
                  child: textField(
                    hint: "Enter Your Age",
                    icon: Icons.calendar_today,
                    controller: ageController,
                    obscure: false,
                    keyboardType: TextInputType.number, // Ensure numeric input
                  ),
                ),
                const SizedBox(height: 20),

                // Additional Info Field (Multiline)
                SizedBox(
                  height: 120,
                  child: textField(
                    hint: "Additional Information",
                    icon: Icons.info,
                    controller: additionalInfoController,
                    obscure: false,
                  ),
                ),
                const SizedBox(height: 20),

                // Sport Dropdown
                DropdownButtonFormField<String>(
                  value: selectedSport,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.sports, color: Colors.redAccent),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    hintText: "Select Your Sport",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none, // Remove the default border
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ), // Adjust content padding
                  ),
                  dropdownColor:
                      Colors
                          .grey
                          .shade900, // Set the dropdown background color to match theme
                  style: const TextStyle(
                    color: Colors.white,
                  ), // Text color of selected item
                  items:
                      ['Cricket', 'Football', 'Basketball', 'Tennis'].map((
                        sport,
                      ) {
                        return DropdownMenuItem<String>(
                          value: sport,
                          child: Text(
                            sport,
                            style: const TextStyle(
                              color: Colors.white,
                            ), // Color of dropdown items
                          ),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSport = value!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Register Button
                ElevatedButton(
                  onPressed: handleLogin,
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputType keyboardType =
        TextInputType.text, // Added to specify numeric input
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
        keyboardType: keyboardType, // Specify the keyboard type
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
