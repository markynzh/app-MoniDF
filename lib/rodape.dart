import 'package:flutter/material.dart';
import 'tema.dart';
import 'tela_home.dart';
import 'tela_perfil.dart';

//barra de navegacao inferior, compartilhada pelas telas
class Rodape extends StatelessWidget {
  final int indiceAtual; // 0=home 1=livro 2=monitores 3=agenda 4=perfil

  const Rodape({super.key, required this.indiceAtual});

  static const _icones = [
    Icons.home_outlined,
    Icons.menu_book_outlined,
    Icons.school_outlined,
    Icons.calendar_today_outlined,
    Icons.person_outline,
  ];

  void _ir(BuildContext context, int i) {
    if (i == indiceAtual) return;

    final Widget? destino = switch (i) {
      0 => const TelaHome(),
      4 => const TelaPerfil(),
      _ => null, // TODO: demais telas
    };
    if (destino == null) return;

    //troca de tela sem animacao, como numa aba
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondary) => destino,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black, width: 2)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icones.length, (i) {
              return IconButton(
                onPressed: () => _ir(context, i),
                iconSize: 40,
                icon: Icon(
                  _icones[i],
                  color: i == indiceAtual ? azulPrincipal : textoEscuro,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}