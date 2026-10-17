class Animal {
  final int id;
  final String nome, especie, idade, porte, temperamento, historia, foto;

  Animal({
    required this.id,
    required this.nome,
    required this.especie,
    required this.idade,
    required this.porte,
    required this.temperamento,
    required this.historia,
    required this.foto,
  });

  factory Animal.fromJson(Map<String, dynamic> j) => Animal(
        id: j['id'],
        nome: j['nome'],
        especie: j['especie'],
        idade: j['idade'],
        porte: j['porte'],
        temperamento: j['temperamento'],
        historia: j['historia'],
        foto: j['foto'],
      );
}
