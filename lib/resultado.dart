import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao <= 8) {
      return ('Escolhas Ruins');
    } else if (pontuacao > 8 && pontuacao < 16) {
      return ('Escolhas Razoáveis');
    } else if (pontuacao > 16 && pontuacao <= 28) {
      return ('Boas Escolhas');
    } else {
      return ('Perfeito');
    }
  }

  Color get colorResultado {
    if (pontuacao <= 8) {
      return Colors.red.shade300;
    } else if (pontuacao > 8 && pontuacao < 16) {
      return Colors.orange.shade300;
    } else if (pontuacao > 16 && pontuacao <= 28) {
      return Colors.green.shade300;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Após analisar suas respostas, posso dizer que fez:',
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            width: 280,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: colorResultado,
                width: 3.0,
              ),
            ),
            child: Center(
              child: Text(
                fraseResultado,
                style: TextStyle(fontSize: 28, color: colorResultado),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: quandoReiniciarQuestionario,
            child: const Text(
              'Reiniciar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
