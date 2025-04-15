import 'dart:ui';
import 'package:athlete_360/Pages/LoginScreen.dart';
import 'package:athlete_360/Pages/role_selection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class gettingStarted extends StatelessWidget {
  const gettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/getting_started/background.png'),

            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // shift to bottom
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 60.0,
                ), // space from bottom
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      constraints: const BoxConstraints(
                        minHeight: 250,
                      ), // increased height
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 28,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                          160,
                          0,
                          0,
                          0,
                        ), // dark translucent black
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color.fromARGB(
                            120,
                            255,
                            255,
                            255,
                          ), // semi-white stroke
                          width: 2.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/getting_started/logo.png',
                            height: 110,
                          ),
                          const SizedBox(height: 35),
                          // Getting started btn
                          ElevatedButton(
                            onPressed: () {
                             context.push('/role_selection');

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 42,
                                vertical: 18,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'Getting Started',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
