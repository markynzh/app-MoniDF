import 'package:flutter/material.dart';
import 'tema.dart'; 

//TELA
class MeusDadosScreen extends StatefulWidget {
  const MeusDadosScreen({super.key});

  @override
  State<MeusDadosScreen> createState() => _MeusDadosScreenState();
}

class _MeusDadosScreenState extends State<MeusDadosScreen> {
  // Controllers: guardam o que o usuario digitou em cada campo
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _telefoneController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _salvar() {
    // Por enquanto mostra os dados no console. TODO: conectar ao banco de dados.
    debugPrint('Nome: ${_nomeController.text}');
    debugPrint('Telefone: ${_telefoneController.text}');
    debugPrint('E-mail: ${_emailController.text}');
    debugPrint('Senha: ${_senhaController.text}');
  }

  void _excluirConta() {
    debugPrint('Excluir conta clicado');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: textoEscuro),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Meus Dados',
          style: TextStyle(
            color: textoEscuro,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              CampoTexto(
                hint: 'Nome',
                icone: Icons.person_outline,
                controller: _nomeController,
                teclado: TextInputType.name,
              ),
              const SizedBox(height: 32),
              CampoTexto(
                hint: 'Telefone',
                icone: Icons.phone,
                controller: _telefoneController,
                teclado: TextInputType.phone,
              ),
              const SizedBox(height: 32),
              CampoTexto(
                hint: 'E-mail',
                icone: Icons.person_outline,
                controller: _emailController,
                teclado: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              CampoTexto(
                hint: 'Senha',
                icone: Icons.lock,
                controller: _senhaController,
                senha: true,
              ),
              const SizedBox(height: 40),

              // Botão Salvar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulPrincipal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Excluir conta
              TextButton(
                onPressed: _excluirConta,
                child: const Text(
                  'Excluir conta',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget reutilizavel
class CampoTexto extends StatelessWidget {
  final String hint;
  final IconData icone;
  final bool senha;
  final TextInputType teclado;
  final TextEditingController? controller;

  const CampoTexto({
    super.key,
    required this.hint,
    required this.icone,
    this.senha = false,
    this.teclado = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: senha, // esconde a senha
      keyboardType: teclado,
      style: const TextStyle(color: textoEscuro, fontSize: 16),
      decoration: InputDecoration(
        filled: true,
        fillColor: azulClaro,
        hintText: hint,
        hintStyle: const TextStyle(color: azulPrincipal, fontSize: 16),
        prefixIcon: Icon(icone, color: azulPrincipal),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none, 
        ),
      ),
    );
  }
}
