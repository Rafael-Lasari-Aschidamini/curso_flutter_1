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
  // Questionario objetoQuestionario = Questionario(
  //   perguntas: perguntas,
  //   perguntaSelecionada: perguntaSelecionada,
  //   responder: responder,
  // );

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'Verde', 'pontuacao': 5},
        {'texto': 'Branco', 'pontuacao': 8},
        {'texto': 'Amarelo', 'pontuacao': 3},
        {'texto': 'Azul', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual o modelo de celular utiliza?',
      'resposta': [
        {'texto': 'Android', 'pontuacao': 8},
        {'texto': 'Motorola', 'pontuacao': 6},
        {'texto': 'Iphone', 'pontuacao': 10},
        {'texto': 'Outras', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual a sua marca de tenis favorita?',
      'resposta': [
        {'texto': 'Nike', 'pontuacao': 10},
        {'texto': 'Adidas', 'pontuacao': 8},
        {'texto': 'Puma', 'pontuacao': 6},
        {'texto': 'Outras', 'pontuacao': 1},
      ]
    },
  ];

  bool get temPergunta {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
        body: obj.temPergunta
            ? obj
            : Resultado(
                _pontuacaoTotal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}
