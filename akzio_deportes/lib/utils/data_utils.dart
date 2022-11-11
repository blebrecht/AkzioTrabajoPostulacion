import 'package:akzio_deportes/model/sport.dart';
import 'package:akzio_deportes/utils/message_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';

class DataUtils {
  static Future<List<Sport>> getSports() async {
    var url = Uri.http("localhost:8080","api/v1/sports");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      var parsedJson = json.decode(response.body);

      List<Sport> sports = (parsedJson as List).map((i) => Sport.fromJson(i)).toList();

      return sports;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      return [];
    }
  }

  static Future<List<User>> getUsers() async {

    var url = Uri.http("localhost:8080","api/v1/user");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON

      var parsedJson = json.decode(response.body);

      List<User> users = (parsedJson as List).map((i) => User.fromJson(i)).toList();
      return users;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      return [];
    }
  }

  static Future<bool> deleteUser(String id,BuildContext context) async{
    var url = Uri.http("localhost:8080","api/v1/user/deletesport/$id");

    var response = await http.delete(url);
    if (response.statusCode == 200) {
      // Si el servidor devuelve una repuesta OK, parseamos el JSON
      MessageUtils.popMessage(context,
          "¡Usuario eliminado!",
          "El usuario fue eliminado correctamente",
          "Aceptar");
      return true;
    } else {
      // Si esta respuesta no fue OK, lanza un error.
      MessageUtils.popMessage(context,
          "¡Error!",
          "No se ha podido eliminar el usuario",
          "Aceptar");
      return false;
    }
  }

  static Future<bool> addUser(String email,List<Sport> sports,BuildContext context) async {
    var url = Uri.http("localhost:8080", "api/v1/user");
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        })
    );

    var parsedJson = json.decode(response.body);
    if (parsedJson["message"] == "email_taken") {
      MessageUtils.popMessage(context,
          "¡Error!",
          "Un usuario con ese email ya existe",
          "Aceptar");
      return false;
    }


    String userId = parsedJson["message"];

    for(Sport sport in sports){
      String sportId = sport.id.toString();
      if(sport.added){
        url = Uri.http("localhost:8080","api/v1/user/addsport/$userId/$sportId");
        response = await http.post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            }
        );
      }
    }

    MessageUtils.popMessage(context,
        "¡Usuario agregado!",
        "El usuario fue agregado correctamente",
        "Aceptar");
    return true;
  }
}