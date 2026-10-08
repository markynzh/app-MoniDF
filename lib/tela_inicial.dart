import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tema.dart';
import 'tela_login.dart';

void main() => runApp(const MoniDFApp());

class MoniDFApp extends StatelessWidget {
  const MoniDFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoniDF',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              const Spacer(flex: 2),

              //logo
              const LogoUnDF(),

              const SizedBox(height: 28),

              //titulo
              Text(
                'MoniDF',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: azulPrincipal,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'BEM-VINDO',
                style: GoogleFonts.poppins(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: textoEscuro,
                  letterSpacing: 0.5,
                ),
              ),

              const Spacer(flex: 2),

              //botao login
              SizedBox(
                width: double.infinity,
                height: 88,
                child: ElevatedButton(
                  onPressed: () {
                    //navega para a tela de login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TelaLogin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: azulPrincipal,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              //botao cadastro
              SizedBox(
                width: double.infinity,
                height: 84,
                child: OutlinedButton(
                  onPressed: () {
                    // TODO: navegar para a tela de cadastro
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: azulPrincipal,
                    side: const BorderSide(color: azulPrincipal, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Text(
                    'Cadastre-se',
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
