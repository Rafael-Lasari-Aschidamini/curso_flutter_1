import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    var resposta = temPergunta ? (perguntas[perguntaSelecionada]['resposta']) as List : [];

    return Card(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Questao(perguntas[perguntaSelecionada]['texto'].toString()),
              ...resposta.map((resp) {
                return Resposta(resp['texto'].toString(), () => responder(int.parse(resp['pontuacao'].toString())));
              })
            ],
          ),
        ),
      ),
    );
  }
}
