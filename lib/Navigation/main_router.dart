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
import 'package:athlete_360/Pages/PlayerProfilePage.dart';
import 'package:athlete_360/Pages/LoginScreen.dart';

class MainRouter {
  final GoRouter router = GoRouter(
    // use this while debugging for now
    initialLocation: "/LoginScreen",
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text("Error: ${state.error}"))),
    routes: [
      GoRoute(
        path: "/LoginScreen",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/player",
        builder: (context, state) => const gettingStarted(),
      ),
      // base.dart navigation bar
      /// SHELL ROUTE - for base layout
      ShellRoute(
        builder: (context, state, child) {
          return PlayerBase(title: 'Player Base', child: child);
        },
        routes: [
          GoRoute(
            path: "/home",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: HomeScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: "/events",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: EventsScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: "/venues",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: VenuesScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: "/messages",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: MessagesScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          // GoRoute(
          //   path: "/center",
          //   builder: (context, state) => CenterScreen(),
          // ),
        ],
      ),
      GoRoute(
        path: "/playerProfile",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PlayerProfilePage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),

      GoRoute(
        path: "/coachSelection",
        builder: (context, state) => const CoachScreen(),
      ),
    ],
  );
}
