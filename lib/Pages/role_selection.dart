import 'package:flutter/material.dart';

class role_selection extends StatelessWidget {
  const role_selection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8), // overlay for readability
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),

                  // Logo and app name
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo.png', height: 150),
                        const SizedBox(height: 10),
                        const Text(
                          "Know. Control. Achieve",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Title
                  const Text(
                    "Create Account to\nAthletecs",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Buttons
                  RoleButton(
                    label: "Continue as Player",

                    onPressed: () {
                      Navigator.pushNamed(context, "/signup_player");
                    },
                  ),
                  const SizedBox(height: 20),
                  RoleButton(
                    label: "Continue as Coach",
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup_coach");
                    },
                  ),
                  const SizedBox(height: 16),
                  RoleButton(
                    label: "Continue as Sponsor",
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup_sponsor");
                    },
                  ),

                  const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoleButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: const Color.fromARGB(255, 191, 45, 45),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
