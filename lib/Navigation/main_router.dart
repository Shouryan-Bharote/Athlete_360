import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'package:athlete_360/Pages/CoachVenue.dart';
import 'package:athlete_360/Pages/RegisterScreen.dart';
import 'package:athlete_360/Pages/role_selection.dart';
import 'package:athlete_360/Pages/gettingstarted.dart';
import 'package:athlete_360/Pages/base.dart';
import 'package:athlete_360/Pages/EventsScreen.dart';
import 'package:athlete_360/Pages/HomeScreen.dart';
import 'package:athlete_360/Pages/MessagesScreen.dart';
import 'package:athlete_360/Pages/coach_selection.dart';
import 'package:athlete_360/Pages/PlayerProfilePage.dart';
import 'package:athlete_360/Pages/chat_room_screen.dart';

import 'package:athlete_360/Pages/LoginScreen.dart';
import 'package:athlete_360/Pages/Aicoach.dart';

// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class MainRouter {
  final ValueNotifier<User?> authState = ValueNotifier(
    FirebaseAuth.instance.currentUser,
  );

  MainRouter() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      authState.value = user;
    });
  }

  late final GoRouter router = GoRouter(
    refreshListenable: authState,
    initialLocation: "/gettingStarted",

    redirect: (context, state) {
      final loggedIn = authState.value != null;
      final loggingIn = state == '/LoginScreen' || state == '/RegisterScreen';

      if (!loggedIn && !loggingIn) return '/LoginScreen';
      if (loggedIn && loggingIn) return '/home';
      return null;
    },

    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text("Error: ${state.error}"))),
    routes: [
      GoRoute(
        path: "/gettingStarted",
        builder: (context, state) => const gettingStarted(),
      ),
      GoRoute(
        path: "/role_selection",
        builder: (context, state) => const role_selection(),
      ),
      GoRoute(
        path: "/LoginScreen",
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: "/RegisterScreen",
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: "/gettingStarted",
        builder: (context, state) => const gettingStarted(),
      ),


      // ✅ This route does NOT include bottom nav or app bar
      GoRoute(
        path: "/chatRoom",
        builder: (context, state) {
          final userName = state.extra as String;
          return ChatRoomScreen(userName: userName);
        },
      ),

      // ✅ This wraps below routes in PlayerBase with navbar & app bar

      GoRoute(path: "/Aicoach", builder: (context, state) => Aicoach()),
      GoRoute(
        path: "/CoachScreen",
        builder: (context, state) => const CoachScreen(),
      ),

      // base.dart navigation bar
      /// SHELL ROUTE - for base layout
      ShellRoute(
        builder: (context, state, child) {
          return PlayerBase(title: 'Player Base', child: child);
        },
        routes: [
          GoRoute(
            path: "/Aicoach",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: Aicoach(),
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
            path: "/home",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: HomeScreen(),
                transitionsBuilder: (context, animation, _, child) {
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
                transitionsBuilder: (context, animation, _, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            },
          ),
          GoRoute(
            path: "/CoachVenue",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,


                child: CoachVenue(),
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
            path: "/CoachSelectionScreen",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: CoachScreen(),
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
        ],
      ),

      GoRoute(
        path: "/playerProfile",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: PlayerProfilePage(),
            transitionsBuilder: (context, animation, _, child) {
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
            transitionsBuilder: (context, animation, _, child) {
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
