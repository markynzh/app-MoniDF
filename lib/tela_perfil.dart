import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart';
import 'rodape.dart';
import 'tela_acessibilidade.dart';
import 'tela_inicial.dart';

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  //linha de menu (icone, titulo, subtitulo opcional e seta)
  Widget _item({
    required IconData icone,
    required String titulo,
    String? subtitulo,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Row(
          children: [
            Icon(icone, size: 44, color: Colors.black),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: textoEscuro,
                    ),
                  ),
                  if (subtitulo != null)
                    Text(
                      subtitulo,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: textoEscuro,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 40, color: Colors.black),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const divisor = Divider(height: 2, thickness: 2, color: Colors.black);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //cabecalho com avatar, nome e e-mail
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 110,
                    color: azulPrincipal,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome',
                          style: GoogleFonts.poppins(
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: textoEscuro,
                          ),
                        ),
                        Text(
                          'nome@undf.edu.br',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: textoEscuro,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            divisor,

            _item(
              icone: Icons.person,
              titulo: 'Meus Dados',
              subtitulo: 'Altere as informações',
              onTap: () {
                // TODO: tela de meus dados
              },
            ),
            divisor,

            //abre a tela de acessibilidade
            _item(
              icone: Icons.accessibility_new,
              titulo: 'Acessibilidade',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaAcessibilidade()),
                );
              },
            ),
            divisor,

            _item(
              icone: Icons.description_outlined,
              titulo: 'Termos de uso',
              onTap: () {
                // TODO: tela de termos de uso
              },
            ),

            const Spacer(),

            //botao sair: volta para a tela inicial e limpa o historico
            OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const TelaInicial()),
                  (route) => false,
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding:
                    const EdgeInsets.symmetric(horizontal: 56, vertical: 22),
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Sair',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const Rodape(indiceAtual: 4),
    );
  }
}