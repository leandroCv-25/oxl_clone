class City {
  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json['id'], name: json['nome']);

  int id;
  String name;
}
