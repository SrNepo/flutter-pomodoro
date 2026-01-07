
import 'dart:async';

enum EstadoPomodoro { parado, rodando, pausado }

class Cronometro {
  EstadoPomodoro estado = EstadoPomodoro.parado;

  int minutos = 25;
  int segundos = 0;
  Timer? _timer;

  String get exibindo =>
      '${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';

  void play(void Function() onTick) {
    if (_timer != null) return;

    estado = EstadoPomodoro.rodando;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (minutos == 0 && segundos == 0) {
        stop();
        onTick();
        return;
      }

      if (segundos == 0) {
        minutos--;
        segundos = 59;
      } else {
        segundos--;
      }

      onTick(); // avisa a UI
    });
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
    estado = EstadoPomodoro.pausado;
  }

  void stop() {
    _timer?.cancel();
    _timer = null;

    estado = EstadoPomodoro.parado;
    minutos = 25;
    segundos = 0;
  }

  void dispose() {
    _timer?.cancel();
  }
}
