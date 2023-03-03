import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resultado.dart';
import './questionario.dart';

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

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder() {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //for (var textoResp in resposta) {
    //widgets.add(Resposta(textoResp, _responder));a
    //}

    final obj = Questionario(
        perguntas: _perguntas,
        perguntaSelecionada: _perguntaSelecionada,
        responder: _responder);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('_perguntas'),
          ),
          body: obj.temPergunta ? obj : const Resultado()),
    );
  }
}
