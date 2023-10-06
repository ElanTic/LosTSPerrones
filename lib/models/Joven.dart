import 'dart:io';

class Joven {
  String nombre; // nombre
  String? email; // email
  String? telefono; // telefono
  String? infoContacto; // contacto

  Joven({
    required this.nombre,
    this.email,
    this.telefono,
    this.infoContacto,
  });

  factory Joven.fromJson(Map<String, dynamic> json) {
    return Joven(
      nombre: json['nombre'],
      email: json['email'],
      telefono: json['telefono'],
      infoContacto: json['contacto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
      'telefono': telefono,
      'contacto': infoContacto,
    };
  }
}
