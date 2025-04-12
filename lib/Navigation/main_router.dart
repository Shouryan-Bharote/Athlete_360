import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'package:athlete_360/Pages/gettingstarted.dart';
import 'package:athlete_360/Pages/base.dart';
import 'package:athlete_360/Pages/EventsScreen.dart';
import 'package:athlete_360/Pages/HomeScreen.dart';
import 'package:athlete_360/Pages/MessagesScreen.dart';
import 'package:athlete_360/Pages/VenuesScreen.dart';
import 'package:athlete_360/Pages/coach_selection.dart';

class MainRouter {
  final GoRouter router = GoRouter(
    // use this while debugging for now
    initialLocation: "/home",
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text("Error: ${state.error}"))),
    routes: [
      GoRoute(
        path: "/gettingstarted",
        builder: (context, state) => const gettingStarted(),
      ),
      // base.dart navigation bar
      /// SHELL ROUTE - for base layout
      ShellRoute(
        builder: (context, state, child) {
          return PlayerBase(
            title: 'Flutter Demo Home Page',
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: "/home",
            builder: (context, state) => HomeScreen(), // this is the main body
          ),
          GoRoute(
            path: "/events",
            builder: (context, state) => EventsScreen(),
          ),
          GoRoute(
            path: "/venues",
            builder: (context, state) => VenuesScreen(),
          ),
          GoRoute(
            path: "/messages",
            builder: (context, state) => MessagesScreen(),
          ),
          // GoRoute(
          //   path: "/center",
          //   builder: (context, state) => CenterScreen(),
          // ),
        ],
      ),
      GoRoute(
        path: "/coachSelection",
        builder: (context, state) => const CoachScreen(),
      ),
    ],
  );
}
