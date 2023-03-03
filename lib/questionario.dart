import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_perguntas/questao.dart';
import './questao.dart';
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
    var resposta =
        temPergunta ? (perguntas[perguntaSelecionada]['resposta']) as List : [];

    List<Widget> widgets = resposta.map((resp) {
      return Resposta(
        resp['texto'] as String,
        () => responder(resp['pontuacao']),
      );
    }).toList();

    return Column(
      children: <Widget>[
        // Questao(perguntas.elementAt(perguntaSelecionada)['texto'].toString()),
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...resposta.map((resp) {
          return Resposta(resp['texto'].toString(),
              () => responder(int.parse(resp['pontuacao'].toString())));
        })
      ],
    );
  }
}
