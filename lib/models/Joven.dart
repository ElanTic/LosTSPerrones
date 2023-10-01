import 'dart:io';

class Joven {
  String email;

  String nombre;

  String telefono;

  String userID;

  String infoContacto;

  String appIdentifier;

  Joven(
      {this.email = '',
      this.nombre = '',
      this.telefono = '',
      this.userID = '',
      this.infoContacto = ''})
      : appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  String fullName() => '$nombre $telefono';

  factory Joven.fromJson(Map<String, dynamic> parsedJson) {
    return Joven(
        email: parsedJson['email'] ?? '',
        nombre: parsedJson['nombre'] ?? '',
        telefono: parsedJson['telefono'] ?? '',
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        infoContacto: parsedJson['infoContacto'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'nombre': nombre,
      'telefono': telefono,
      'id': userID,
      'infoContacto': infoContacto,
      'appIdentifier': appIdentifier
    };
  }
}
