import 'package:flutter/material.dart';
import 'screens/lista_screen.dart';

void main() => runApp(const AbrigoApp());

class AbrigoApp extends StatelessWidget {
  const AbrigoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Abrigo Patinhas',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
    home: const ListaScreen(),
  );
}