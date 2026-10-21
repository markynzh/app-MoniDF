import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart';
import 'rodape.dart';

//dados de um agendamento (por enquanto so de exemplo)
class Agendamento {
  final String pessoa; // monitor (visao do aluno) ou aluno (visao do monitor)
  final String disciplina;
  final String dia;
  final String horario;

  const Agendamento({
    required this.pessoa,
    required this.disciplina,
    required this.dia,
    required this.horario,
  });
}

class TelaAgendamentos extends StatelessWidget {
  const TelaAgendamentos({super.key});

  //TODO: trocar pelos dados reais quando houver backend
  static const _comoAluno = [
    Agendamento(
        pessoa: 'Monitor', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
    Agendamento(
        pessoa: 'Monitor', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
  ];
  static const _comoMonitor = [
    Agendamento(
        pessoa: 'Aluno', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
    Agendamento(
        pessoa: 'Aluno', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
  ];
  static const _historico = [
    Agendamento(
        pessoa: 'Monitor', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
    Agendamento(
        pessoa: 'Monitor', disciplina: 'Disciplina', dia: 'Dia', horario: 'Horário'),
  ];

  //botao de filtro
  Widget _filtro() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // TODO: abrir opcoes de filtro
        },
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: azulPrincipal, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Icon(Icons.filter_alt_outlined,
                  size: 32, color: textoEscuro),
              const SizedBox(width: 12),
              Text(
                'Filtrar',
                style: GoogleFonts.poppins(fontSize: 20, color: textoEscuro),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //secao com titulo e lista horizontal de cards
  Widget _secao(String titulo, List<Agendamento> itens) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 2, thickness: 2, color: Colors.black),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
          child: Text(
            titulo,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textoEscuro,
            ),
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: itens.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (_, i) => _CardAgendamento(agendamento: itens[i]),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //titulo
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Agendamentos',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: textoEscuro,
                  ),
                ),
              ),
            ),
            _filtro(),

            //as tres secoes rolam juntas
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _secao('Aluno', _comoAluno),
                    _secao('Monitor', _comoMonitor),
                    _secao('Histórico', _historico),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Rodape(indiceAtual: 3),
    );
  }
}

//card azul de um agendamento
class _CardAgendamento extends StatelessWidget {
  final Agendamento agendamento;

  const _CardAgendamento({required this.agendamento});

  @override
  Widget build(BuildContext context) {
    final estilo = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      height: 1.4,
    );

    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      color: azulPrincipal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(agendamento.pessoa, style: estilo),
          Text(agendamento.disciplina, style: estilo),
          Text(agendamento.dia, style: estilo),
          Text(agendamento.horario, style: estilo),
        ],
      ),
    );
  }
}