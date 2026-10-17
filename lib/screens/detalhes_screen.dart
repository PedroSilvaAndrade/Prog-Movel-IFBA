import 'package:flutter/material.dart';
import '../models/animal.dart';
import '../state/app_state.dart';

class DetalhesScreen extends StatelessWidget {
  final Animal animal;
  const DetalhesScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    final estado = AppState.instance;
    return ListenableBuilder(
      listenable: estado,
      builder: (context, _) {
        final fav = estado.favoritos.contains(animal.id);
        return Scaffold(
          appBar: AppBar(title: Text(animal.nome)),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset(
                animal.foto,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.pets, size: 120),
              ),
              const SizedBox(height: 16),
              Text('${animal.especie} • ${animal.idade}',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('Porte: ${animal.porte}'),
              Text('Temperamento: ${animal.temperamento}'),
              const SizedBox(height: 16),
              Text('História', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(animal.historia),
              const SizedBox(height: 24),
              if (estado.logado)
                FilledButton.icon(
                  onPressed: () => estado.toggleFavorito(animal.id),
                  icon: Icon(fav ? Icons.favorite : Icons.favorite_border),
                  label: Text(fav ? 'Remover dos favoritos' : 'Favoritar'),
                )
              else
                const Text(
                  'Faça login para favoritar este animal.',
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        );
      },
    );
  }
}
