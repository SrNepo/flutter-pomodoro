import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int minutos = 25;
  int segundos = 0;
  Timer? timer;
  String exibindo = '25:00';

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (minutos == 0 && segundos == 0) {
          timer?.cancel();
          return;
        }

        if (segundos == 0) {
          minutos--;
          segundos = 59;
        } else {
          segundos--;
        }

        exibindo =
            '${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tarefa atual: \nFazendo um app pomodoro",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Container(
              height: 150,
              width: 300,
              margin: EdgeInsets.only(top: 150, bottom: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red[900],
              ),
              child: Center(
                child: Text(
                  exibindo,
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
