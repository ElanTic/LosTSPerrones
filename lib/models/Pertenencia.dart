import 'package:flutter/material.dart';

class Pertenencia {
  int id; //this is primary key
  int dueno; // this is foreign key from joven_0 table
  String nombre;
  String categoria;
  String marca;
  String modelo;
  Color color;
  String descripcion; //this should be a litle longer string
  String foto; //this should be an url

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
