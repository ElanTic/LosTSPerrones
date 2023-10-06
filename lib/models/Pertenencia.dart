import 'dart:convert';

class Pertenencia {
  int id;
  int dueno;
  String nombre;
  String? categoria;
  String? marca;
  String? modelo;
  String? color; // Assuming color is represented as a String
  String? descripcion;
  String? foto;

  Pertenencia({
    required this.id,
    required this.dueno,
    required this.nombre,
    this.categoria,
    this.marca,
    this.modelo,
    this.color,
    this.descripcion,
    this.foto,
  });

  factory Pertenencia.fromJson(Map<String, dynamic> json) {
    return Pertenencia(
      id: json['id'],
      dueno: json['dueno'],
      nombre: json['nombre'],
      categoria: json['categoria'],
      marca: json['marca'],
      modelo: json['modelo'],
      color: json['color'],
      descripcion: json['descripcion'],
      foto: json['foto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dueno': dueno,
      'nombre': nombre,
      'categoria': categoria,
      'marca': marca,
      'modelo': modelo,
      'color': color,
      'descripcion': descripcion,
      'foto': foto,
    };
  }
}
