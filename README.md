# Abrigo Patinhas – App de adoção de cães e gatos (Flutter/Dart)

Front-end móvel que lista animais de um abrigo fictício.

## Funcionalidades
- Lista de animais (foto, nome, idade) e tela de detalhes (porte, temperamento, história)
- Sem login: visualiza lista e detalhes
- Com login: pode favoritar/desfavoritar animais
- Login mockado (usuário `admin`, senha `1234`) e logoff
- Dados em JSON estático (`assets/data/animais.json`)

## Como executar
1. Instale o Flutter SDK e o Android Studio (SDK + emulador).
2. `flutter pub get`
3. Inicie um emulador Android (ou conecte um celular) e rode `flutter run`.

## Estrutura
- `lib/main.dart` – ponto de entrada
- `lib/models/animal.dart` – modelo
- `lib/state/app_state.dart` – login mockado e favoritos
- `lib/screens/` – telas de lista, detalhes e login
