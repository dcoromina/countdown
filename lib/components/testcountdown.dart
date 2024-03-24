// main.dart
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const TestCountdown());
}

class TestCountdown extends StatelessWidget {
  const TestCountdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Elimina el banner de depuración
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KindaCodeDemo(),
    );
  }
}

class KindaCodeDemo extends StatefulWidget {
  const KindaCodeDemo({Key? key}) : super(key: key);

  @override
  State<KindaCodeDemo> createState() => _KindaCodeDemoState();
}

class _KindaCodeDemoState extends State<KindaCodeDemo> {
  // Segundos, minutos y horas
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;

  // Estado del temporizador (en ejecución o no)
  bool _isRunning = false;

  // El temporizador
  Timer? _timer;

  // Esta función se llama cuando el usuario presiona el botón de inicio
  // Inicia el temporizador
  // El temporizador se ejecutará cada segundo
  // El temporizador se detendrá cuando las horas, minutos y segundos sean todos 0
  void _startTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_seconds > 0) {
          setState(() {
            _seconds--;
          });
        } else {
          if (_minutes > 0) {
            setState(() {
              _minutes--;
              _seconds = 59;
            });
          } else {
            if (_hours > 0) {
              setState(() {
                _hours--;
                _minutes = 59;
                _seconds = 59;
              });
            } else {
              _isRunning = false;
              _timer?.cancel();
            }
          }
        }
      });
    }
  }

  // Otras funciones como pausar el temporizador o reiniciar el temporizador
  // pueden agregarse según sea necesario.

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporizador de Cuenta Regresiva'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiempo restante:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_hours:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: _startTimer,
              child: Text(_isRunning ? 'Pausar' : 'Iniciar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _hours = 0;
                  _minutes = 0;
                  _seconds = 0;
                  _isRunning = false;
                  _timer?.cancel();
                });
              },
              child: const Text('Cancelar'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
