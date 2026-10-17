import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  static final AppState instance = AppState();

  String? usuario;
  final Set<int> favoritos = {};

  bool get logado => usuario != null;

  // Login mockado: credenciais fictícias fixas no código.
  bool login(String user, String senha) {
    if (user == 'admin' && senha == '1234') {
      usuario = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    usuario = null;
    favoritos.clear();
    notifyListeners();
  }

  void toggleFavorito(int id) {
    favoritos.contains(id) ? favoritos.remove(id) : favoritos.add(id);
    notifyListeners();
  }
}
