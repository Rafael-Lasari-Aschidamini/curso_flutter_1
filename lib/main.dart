import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': ['Verde', 'Branco', 'Amarelo', 'Azul']
    },
    {
      'texto': 'Qual o modelo de celular utiliza?',
      'resposta': ['Android', 'Motorola', 'Iphone', 'Outras']
    },
    {
      'texto': 'Qual a sua marca de tenis favorita?',
      'resposta': ['Nike', 'Adidas', 'Puma', 'Outras']
    },
  ];

  void _responder() {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> resposta =
        temPergunta ? (_perguntas[_perguntaSelecionada]['resposta']) : [];

    List<Widget> widgets =
        resposta.map((t) => Resposta(t, _responder)).toList();
    //for (var textoResp in resposta) {
    //widgets.add(Resposta(textoResp, _responder));a
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('_perguntas'),
        ),
        body: temPergunta
            ? Column(
                children: <Widget>[
                  Questao(_perguntas
                      .elementAt(_perguntaSelecionada)['texto']
                      .toString()),
                  ...widgets
                ],
              )
            : const Center(
                child: Text(
                  'Obrigado pela Resposta',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}
