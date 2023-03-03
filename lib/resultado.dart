import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Obrigado pela Resposta',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
