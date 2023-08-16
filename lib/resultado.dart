import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario, {super.key});

  String get fraseResultado {
    if (pontuacao <= 8) {
      return ('Escolhas Ruins');
    } else if (pontuacao > 8 && pontuacao < 16) {
      return ('Escolhas Rasuaveis');
    } else if (pontuacao > 16 && pontuacao <= 28) {
      return ('Boas Escolhas');
    } else {
      return ('Perfeito');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: quandoReiniciarQuestionario,
          child: const Text('Reiniciar',
              style: TextStyle(
                color: Colors.blue,
              )),
        ),
      ],
    );
  }
}
