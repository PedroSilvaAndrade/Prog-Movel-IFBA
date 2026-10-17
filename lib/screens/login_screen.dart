import 'package:flutter/material.dart';
import '../state/app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _user = TextEditingController();
  final _senha = TextEditingController();
  String? _erro;

  @override
  void dispose() {
    _user.dispose();
    _senha.dispose();
    super.dispose();
  }

  void _entrar() {
    if (AppState.instance.login(_user.text.trim(), _senha.text)) {
      Navigator.pop(context);
    } else {
      setState(() => _erro = 'Usuário ou senha inválidos');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _user,
                decoration: const InputDecoration(labelText: 'Usuário'),
              ),
              TextField(
                controller: _senha,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              if (_erro != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(_erro!, style: const TextStyle(color: Colors.red)),
                ),
              const SizedBox(height: 16),
              FilledButton(onPressed: _entrar, child: const Text('Entrar')),
              const SizedBox(height: 16),
              const Text('Teste: admin / 1234'),
            ],
          ),
        ),
      );
}
