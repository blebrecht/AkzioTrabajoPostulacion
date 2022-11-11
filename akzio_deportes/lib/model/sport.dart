class Sport {
  int id;
  String name;
  bool added;

  Sport({required this.id,required this.name,required this.added});

  factory Sport.fromJson(Map<String, dynamic> parsedJson) {
    return Sport(
      id: parsedJson['id'] as int,
      name: parsedJson['name'],
      added: false,
    );
  }

  Map toJson() => {
    'id': id,
    'name': name,
  };
}