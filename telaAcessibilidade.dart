import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tema.dart';

// Tela para configuracoes de temas visuais e acessibilidade do app
class TelaAcessibilidade extends StatelessWidget {
  const TelaAcessibilidade({super.key});
  // Template para as linhas de configuracao de acessibilidade
  Widget _buildItemAcessibilidade({
    required IconData icone,
    required String titulo,
    required String valor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Icon(icone, size: 36, color: textoEscuro),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: textoEscuro,
                    ),
                  ),
                  Text(
                    valor,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textoEscuro,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, size: 28, color: textoEscuro),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textoEscuro, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Acessibilidade',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textoEscuro,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            // Configuracao de Tema / Aparencia
            _buildItemAcessibilidade(
              icone: Icons.nightlight_round_outlined,
              titulo: 'Aparência',
              valor: 'Modo claro',
              onTap: () {},
            ),
            const Divider(thickness: 1.5, color: Colors.black12),
            // Selecao do Idioma
            _buildItemAcessibilidade(
              icone: Icons.language,
              titulo: 'Idioma',
              valor: 'Português',
              onTap: () {},
            ),
            const Divider(thickness: 1.5, color: Colors.black12),
            // Ajuste de Tamanho da Fonte
            _buildItemAcessibilidade(
              icone: Icons.text_fields,
              titulo: 'Tamanho da fonte',
              valor: 'Padrão',
              onTap: () {},
            ),
            const Divider(thickness: 1.5, color: Colors.black12),
            // Ajustes para Visao de Cores / Daltonismo
            _buildItemAcessibilidade(
              icone: Icons.visibility_outlined,
              titulo: 'Modo daltonismo',
              valor: 'Tritanopia',
              onTap: () {},
            ),
            const Divider(thickness: 1.5, color: Colors.black12),
          ],
        ),
      ),
    );
  }
}
