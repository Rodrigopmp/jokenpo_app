import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Jokenpô")),
        body: const Jokenpo(),
      ),
    );
  }
}

class Jokenpo extends StatefulWidget {
  const Jokenpo({super.key});

  @override
  State<Jokenpo> createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {
  final opcoes = ["Pedra", "Papel", "Tesoura"];
  String resultado = "Escolha uma opção!";

  void jogar(String escolha) {
    final pc = opcoes[Random().nextInt(3)];
    setState(() {
      if (escolha == pc) {
        resultado = "Empate! ($escolha vs $pc)";
      } else if (
        (escolha == "Pedra" && pc == "Tesoura") ||
        (escolha == "Papel" && pc == "Pedra") ||
        (escolha == "Tesoura" && pc == "Papel")
      ) {
        resultado = "Você venceu! ($escolha vs $pc)";
      } else {
        resultado = "Você perdeu! ($escolha vs $pc)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(resultado, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 30),
          Wrap(
            spacing: 10,
            children: [
              ElevatedButton(onPressed: () => jogar("Pedra"), child: const Text("🪨")),
              ElevatedButton(onPressed: () => jogar("Papel"), child: const Text("📄")),
              ElevatedButton(onPressed: () => jogar("Tesoura"), child: const Text("✂️")),
            ],
          ),
        ],
      ),
    );
  }
}
