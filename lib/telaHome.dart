import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart';
import 'rodape.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //TODO: montar o conteudo (boas-vindas, favoritos, noticias)
          child: Text(
            'Em construção',
            style: GoogleFonts.poppins(fontSize: 20, color: textoEscuro),
          ),
        ),
      ),
      bottomNavigationBar: const Rodape(indiceAtual: 0),
    );
  }
}