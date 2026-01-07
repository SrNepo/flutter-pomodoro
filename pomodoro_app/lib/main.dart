import 'package:flutter/material.dart';
import 'package:pomodoro_app/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.red),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[900],
            iconColor: Colors.white,
            iconSize: 30.0,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 10),
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
