import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart';
import 'rodape.dart';

class TelaMonitor extends StatefulWidget {
  const TelaMonitor({super.key});

  @override
  State<TelaMonitor> createState() => _TelaMonitorState();
}

class _TelaMonitorState extends State<TelaMonitor> {
  //atributos
  final String _nome = 'Thiago'; // TODO: pegar o nome do usuario logado
  final Set<String> _disciplinasSel = {};
  final Set<String> _diasSel = {};
  final Set<String> _horariosSel = {};

  //opcoes de cada secao
  static const List<String> _disciplinas = [
    'Matemática',
    'Computação',
    'Sintaxe',
    'Inglês',
  ];
  static const List<String> _dias = ['SEG', 'TER', 'QUA', 'QUI', 'SEX'];
  static const List<String> _manha = ['8h', '9h', '10h', '11h'];
  static const List<String> _tarde = ['13h', '14h', '15h', '16h'];
  static const List<String> _noite = ['18h', '19h', '20h', '21h'];

  //marca ou desmarca uma opcao (remove devolve false se nao existia)
  void _alternar(Set<String> conjunto, String valor) {
    setState(() {
      if (!conjunto.remove(valor)) conjunto.add(valor);
    });
  }

  //botao retangular azul (fica invertido quando selecionado)
  Widget _chip({
    required String texto,
    required bool selecionado,
    required VoidCallback onTap,
    double? largura,
    double altura = 34,
    double fonte = 15,
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: largura,
        height: altura,
        padding: padding,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selecionado ? Colors.white : azulPrincipal,
          border: Border.all(color: azulPrincipal, width: 2),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Text(
          texto,
          style: GoogleFonts.poppins(
            fontSize: fonte,
            fontWeight: FontWeight.w700,
            color: selecionado ? azulPrincipal : Colors.white,
          ),
        ),
      ),
    );
  }

  //secao com titulo grande e conteudo embaixo
  Widget _secao({required String titulo, required Widget conteudo}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textoEscuro,
            ),
          ),
          const SizedBox(height: 12),
          conteudo,
        ],
      ),
    );
  }

  //coluna de um periodo (titulo + grade 2x2 de horarios)
  Widget _colunaHorario(String titulo, List<String> horas) {
    return Column(
      children: [
        Text(
          titulo,
          style: GoogleFonts.poppins(fontSize: 18, color: textoEscuro),
        ),
        const SizedBox(height: 10),
        //largura = 2 chips (44) + espaco entre eles (6)
        SizedBox(
          width: 94,
          child: Wrap(
            spacing: 6,
            runSpacing: 12,
            children: [
              for (final h in horas)
                _chip(
                  texto: h,
                  selecionado: _horariosSel.contains(h),
                  onTap: () => _alternar(_horariosSel, h),
                  largura: 44,
                  altura: 30,
                  fonte: 14,
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const divisor = Divider(height: 2, thickness: 2, color: Colors.black);

    return Scaffold(
      body: SafeArea(
        //scroll evita overflow em telas menores
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //cabecalho com saudacao
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: textoEscuro,
                        ),
                        children: [
                          const TextSpan(text: 'Olá, '),
                          TextSpan(
                            text: _nome,
                            style: const TextStyle(color: azulPrincipal),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Escolha a disciplina, dias e horários que deseja ensinar!',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: textoEscuro,
                      ),
                    ),
                  ],
                ),
              ),
              divisor,

              //disciplinas
              _secao(
                titulo: 'Disciplinas',
                conteudo: Wrap(
                  spacing: 8,
                  runSpacing: 14,
                  children: [
                    for (final d in _disciplinas)
                      _chip(
                        texto: d,
                        selecionado: _disciplinasSel.contains(d),
                        onTap: () => _alternar(_disciplinasSel, d),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    //botao para ver mais disciplinas
                    _chip(
                      texto: '...',
                      selecionado: false,
                      onTap: () {
                        // TODO: mostrar mais disciplinas
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                    ),
                  ],
                ),
              ),
              divisor,

              //dias
              _secao(
                titulo: 'Dias',
                conteudo: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 14,
                    children: [
                      for (final d in _dias)
                        _chip(
                          texto: d,
                          selecionado: _diasSel.contains(d),
                          onTap: () => _alternar(_diasSel, d),
                          largura: 66,
                          altura: 30,
                        ),
                    ],
                  ),
                ),
              ),
              divisor,

              //horarios
              _secao(
                titulo: 'Horários',
                conteudo: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _colunaHorario('Manhã', _manha),
                    _colunaHorario('Tarde', _tarde),
                    _colunaHorario('Noite', _noite),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Rodape(indiceAtual: 2),
    );
  }
}