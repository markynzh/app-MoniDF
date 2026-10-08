import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart'; // cores e LogoUnDF

//cor dos campos
const Color azulCampo = Color(0xFF8FCBFF);
const Color azulIcone = Color(0xFF4F7FB0);

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  //atributos
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _lembrar = false;
  bool _ocultarSenha = true;

  //liberar memoria
  @override
  void dispose() {
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  //estilo dos campos (o mesmo pros dois)
  InputDecoration _decoracao(String hint, IconData icone, {Widget? sufixo}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(fontSize: 17, color: Colors.black54),
      prefixIcon: Padding(
        padding: const EdgeInsets.only(left: 16, right: 10),
        child: Icon(icone, size: 30, color: azulIcone),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      suffixIcon: sufixo,
      filled: true,
      fillColor: azulCampo,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //scroll evita overflow quando o teclado abre
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              //logo
              const LogoUnDF(),
              const SizedBox(height: 20),

              //titulo
              Text(
                'MoniDF',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: azulPrincipal,
                ),
              ),
              const SizedBox(height: 24),

              //campo email ou matricula
              TextField(
                controller: _loginController,
                keyboardType: TextInputType.emailAddress,
                decoration: _decoracao('E-mail ou Matrícula', Icons.mail),
              ),
              const SizedBox(height: 18),

              //campo senha
              TextField(
                controller: _senhaController,
                obscureText: _ocultarSenha,
                decoration: _decoracao(
                  'Senha',
                  Icons.lock,
                  sufixo: IconButton(
                    icon: Icon(
                      _ocultarSenha ? Icons.visibility_off : Icons.visibility,
                      color: azulIcone,
                    ),
                    onPressed: () =>
                        setState(() => _ocultarSenha = !_ocultarSenha),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              //lembrar de mim
              Row(
                children: [
                  Checkbox(
                    value: _lembrar,
                    onChanged: (v) => setState(() => _lembrar = v ?? false),
                    activeColor: azulPrincipal,
                    side: const BorderSide(color: azulPrincipal, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text('Lembrar de mim',
                      style: GoogleFonts.poppins(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 10),

              //esqueceu a senha
              TextButton(
                onPressed: () {
                  // TODO: navegar para recuperar senha
                },
                child: Text(
                  'Esqueceu a senha?',
                  style: GoogleFonts.poppins(
                      fontSize: 15, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 20),

              //botao login
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: validar e autenticar
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulPrincipal,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text('Login',
                      style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 14),

              //botao cadastro
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: navegar para o cadastro
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: azulPrincipal,
                    side: const BorderSide(color: azulPrincipal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text('Cadastre-se',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
