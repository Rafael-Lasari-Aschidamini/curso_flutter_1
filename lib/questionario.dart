import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_perguntas/questao.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, dynamic>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

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
    List<String> resposta =
        temPergunta ? (perguntas[perguntaSelecionada]['resposta']) : [];
    List<Widget> widgets = resposta.map((t) => Resposta(t, responder)).toList();

    return Column(
      children: <Widget>[
        Questao(perguntas.elementAt(perguntaSelecionada)['texto'].toString()),
        ...widgets
      ],
    );
  }
}
