import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/animal.dart';
import '../state/app_state.dart';
import 'detalhes_screen.dart';
import 'login_screen.dart';

class ListaScreen extends StatefulWidget {
  const ListaScreen({super.key});

  @override
  State<ListaScreen> createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  final estado = AppState.instance;
  late final Future<List<Animal>> _animais = _carregar();

  Future<List<Animal>> _carregar() async {
    final txt = await rootBundle.loadString('assets/data/animais.json');
    final data = jsonDecode(txt) as Map<String, dynamic>;
    return (data['animais'] as List).map((e) => Animal.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: estado,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Abrigo Patinhas'),
          actions: [
            if (estado.logado) ...[
              Center(child: Text('Olá, ${estado.usuario}')),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Sair',
                onPressed: estado.logout,
              ),
            ] else
              IconButton(
                icon: const Icon(Icons.login),
                tooltip: 'Entrar',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                ),
              ),
          ],
        ),
        body: FutureBuilder<List<Animal>>(
          future: _animais,
          builder: (context, snap) {
            if (snap.hasError) {
              return const Center(child: Text('Erro ao carregar os animais.'));
            }
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final lista = snap.data!;
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, i) {
                final a = lista[i];
                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        a.foto,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.pets, size: 40),
                      ),
                    ),
                    title: Text(a.nome),
                    subtitle: Text('${a.especie} • ${a.idade}'),
                    trailing: estado.favoritos.contains(a.id)
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : null,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetalhesScreen(animal: a),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
