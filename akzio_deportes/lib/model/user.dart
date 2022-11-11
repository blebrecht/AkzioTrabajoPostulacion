import 'package:akzio_deportes/model/sport.dart';

class User {
  int id;
  String email;
  List<Sport> sports;

  User({required this.id,required this.email,required this.sports});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    var sportsJson = parsedJson['sports'] as List;
    List<Sport> _sports = sportsJson.map((tagJson) => Sport.fromJson(tagJson)).toList();
    return User(
        id: parsedJson['id'] as int,
        email: parsedJson['email'],
        sports: _sports
    );
  }
}