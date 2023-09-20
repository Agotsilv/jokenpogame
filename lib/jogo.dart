import 'package:flutter/material.dart';
import "dart:math";

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagensApp = AssetImage("assets/padrao.png");
  var _mensagem = "Escolha uma opção a baixo!";

  int pontuacaoUsuario = 0;
  int pontuacaoComputador = 0;

  void _optionSelect(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];

    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagensApp = AssetImage("assets/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagensApp = AssetImage("assets/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagensApp = AssetImage("assets/tesoura.png");
        });
        break;
      default:
        setState(() {
          _imagensApp = AssetImage("assets/padrao.png");
        });
    }

    // Validação do Ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Parabéns você ganhou :)";
        pontuacaoUsuario++;
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        _mensagem = "Você perdeu :(";
        pontuacaoComputador++;
      });
    } else {
      setState(() {
        _mensagem = "Empate!";
      });
    }
  }

  void reset() {
    setState(() {
      _imagensApp = AssetImage("assets/padrao.png");
      pontuacaoUsuario = 0;
      pontuacaoComputador = 0;
      _mensagem = "Escolha uma opção a baixo!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Image(image: _imagensApp),
            Padding(
              padding: EdgeInsets.only(top: 35, bottom: 16),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _optionSelect("pedra"),
                  child: Image.asset("assets/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _optionSelect("papel"),
                  child: Image.asset("assets/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _optionSelect("tesoura"),
                  child: Image.asset("assets/tesoura.png", height: 100),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 32,
              ),
              child: Text(
                "Sua Pontuação: $pontuacaoUsuario",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Pontuação Computador: $pontuacaoComputador",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: reset,
                child: Text("Reset"),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    backgroundColor: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
