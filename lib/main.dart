import 'package:floor_calculator/pages/calculator_page.dart';
import 'package:flutter/material.dart';

//app desenvolvimento na disciplina de Programação para Dispositivos Moveis
//Análise e Desenvolvimento de Sistemas - FATEC - Americana
// Professor Orientador: Kleber Andrade
// Desenvolvimento: Thiago Martiusi Moura

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de pisos',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        buttonTheme: ButtonThemeData(
          height: 32,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: CalculatorPage(),
    );
  }
}
