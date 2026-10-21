import 'package:flutter/material.dart';

//cores
const Color azulPrincipal = Color(0xFF1B4594);
const Color azulMedio = Color(0xFF3F7FCB);
const Color azulClaro = Color(0xFF86BFEF);
const Color textoEscuro = Color(0xFF2B2B2B);

//logo desenhado com losangos (troque por Image.asset quando tiver o arquivo oficial)
class LogoUnDF extends StatelessWidget {
  final double largura;

  const LogoUnDF({super.key, this.largura = 220});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: largura,
      fit: BoxFit.contain,
    );
  }
}

