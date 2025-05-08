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
import 'package:athlete_360/Pages/chat_room_screen.dart';

class MainRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/home",
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text("Error: ${state.error}"))),
    routes: [
      GoRoute(
        path: "/gettingstarted",
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
            path: "/venues",
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: VenuesScreen(),
                transitionsBuilder: (context, animation, _, child) {
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
