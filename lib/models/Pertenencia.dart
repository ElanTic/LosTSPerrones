import 'package:flutter/material.dart';

class Pertenencia {
  int id;
  int dueno;
  String nombre;
  String categoria;
  String marca;
  String modelo;
  Color color;
  String descripcion;
  String foto;

  Pertenencia({
    required this.id,
    required this.dueno,
    required this.nombre,
    this.categoria = '',
    this.marca = '',
    this.modelo = '',
    this.color = Colors.black,
    this.descripcion = '',
    this.foto = '',
  });
}
