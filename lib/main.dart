import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Pages/coach_selection.dart';
import 'Pages/base.dart';
import 'Pages/gettingstarted.dart';
import 'Pages/role_selection.dart';
import 'Pages/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(18, 18, 18, 1),
        ),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: "/LoginScreen",
    errorBuilder:
        (context, state) =>
            Scaffold(body: Center(child: Text("Error: ${state.error}"))),
    routes: [
      GoRoute(
        path: "/",
        builder:
            (context, state) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: "/coachSelection",
        builder: (context, state) => const CoachScreen(),
      ),
      GoRoute(
        path: "/gettingstarted",
        builder: (context, state) => const gettingstarted(),
      ),
      GoRoute(
        path: "/role_selection",
        builder: (context, state) => const role_selection(),
      ),
      GoRoute(
        path: "/LoginScreen",
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
