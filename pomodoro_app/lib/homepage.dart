import 'package:flutter/material.dart';
import 'cronometro.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cronometro cronometro = Cronometro();

  void atualizarTela() {
    setState(() {});
  }

  @override
  void dispose() {
    cronometro.dispose();
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
            const Text(
              "Tarefa atual: \nFazendo um app pomodoro",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),

            Container(
              height: 150,
              width: 300,
              margin: const EdgeInsets.only(top: 150, bottom: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red[900],
              ),
              child: Center(
                child: Text(
                  cronometro.exibindo,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cronometro.estado == EstadoPomodoro.parado
                  ? [
                      ElevatedButton(
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          cronometro.play(atualizarTela);
                          setState(() {});
                        },
                      ),
                    ]
                  : cronometro.estado == EstadoPomodoro.rodando
                  ? [
                      ElevatedButton(
                        child: const Icon(Icons.pause),
                        onPressed: () {
                          cronometro.pause();
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 45),
                      ElevatedButton(
                        child: const Icon(Icons.stop),
                        onPressed: () {
                          cronometro.stop();
                          setState(() {});
                        },
                      ),
                    ]
                  : [
                      ElevatedButton(
                        child: const Icon(Icons.play_arrow),
                        onPressed: () {
                          cronometro.play(atualizarTela);
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 45),
                      ElevatedButton(
                        child: const Icon(Icons.stop),
                        onPressed: () {
                          cronometro.stop();
                          setState(() {});
                        },
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
