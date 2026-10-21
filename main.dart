import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'telaInicial.dart';

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