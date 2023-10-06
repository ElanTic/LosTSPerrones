import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String foto;
  final String nombre;
  final String color;
  final String marca;
  final String modelo;
  final String descripcion;
  const Info({
    required this.color,
    required this.marca,
    required this.modelo,
    required this.nombre,
    required this.foto,
    required this.descripcion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nombre)),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(children: [
          SizedBox(
              child: Image(
            image: NetworkImage(foto),
            height: 400,
            width: 200,
          )),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              child: const Text(
                'Nombre: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(nombre, style: const TextStyle(fontSize: 20)),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              child: const Text(
                'Color: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(color, style: const TextStyle(fontSize: 20)),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              child: const Text(
                'Marca: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(marca, style: const TextStyle(fontSize: 20)),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              child: const Text(
                'Modelo: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(modelo, style: const TextStyle(fontSize: 20)),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              child: const Text(
                'Descripcion: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(descripcion, style: const TextStyle(fontSize: 20)),
            )
          ])
        ]),
      ),
    );
  }
}
