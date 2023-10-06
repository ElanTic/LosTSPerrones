import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:itemtrackers/Views/Info.dart';

class Pertenencia extends StatefulWidget {
  int id;
  int dueno;
  String nombre;
  String categoria;
  String marca;
  String modelo;
  String color; // Assuming color is represented as a String
  String descripcion;
  String foto;

  Pertenencia({
    required this.id,
    required this.dueno,
    required this.nombre,
    this.categoria = '',
    this.marca = '',
    this.modelo = '',
    this.color = '',
    this.descripcion = '',
    this.foto = '',
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

  @override
  State<StatefulWidget> createState() => _Pertenencia();
}

class _Pertenencia extends State<Pertenencia> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Info(
                      color: widget.color,
                      marca: widget.marca,
                      modelo: widget.modelo,
                      nombre: widget.nombre,
                      foto: widget.foto,
                      descripcion: widget.descripcion))));
        },
        splashColor: Colors.blueGrey,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        image: DecorationImage(
                          image: NetworkImage(widget.foto),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white54),
                    child: Text(
                      widget.nombre,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  _createPersonInfoRow(
                      key: widget.color, value: 'color', context: context),
                  const SizedBox(
                    height: 4,
                  ),
                  _createPersonInfoRow(
                      key: widget.marca, value: 'marca', context: context),
                  const SizedBox(
                    height: 4,
                  ),
                  _createPersonInfoRow(
                      key: widget.modelo, value: 'modelo', context: context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _createPersonInfoRow(
      {required String key,
      required String value,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            '$value:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            key,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
