import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';
import 'package:itemtrackers/rest/RDS_joven.dart';
import 'package:itemtrackers/models/Pertenencia.dart';

class Pag extends StatefulWidget {
  const Pag({super.key});

  @override
  State<Pag> createState() => _PagState();
}

class _PagState extends State<Pag> {
  late Future<Joven> futureJoven;
  List<Pertenencia> lista = [];

  @override
  void initState() {
    super.initState();
    RDS_joven rdsj = RDS_joven();

    futureJoven = rdsj.getJoven("Jane Doe");

    RDS_Publicacion rdsp = RDS_Publicacion();

    //ficha con id
    late Future<FichaObjetoP> ficha = rdsp.getFichaObjetoP('1');
    ficha.then((fichaObjeto) {
      print('Attribute 1: ${fichaObjeto.ownerId}');
      print('voltea es esto');
    }).catchError((error) {
      print('Error fetching FichaObjetoP: $error');
    });
    //todas las fichas
    late Future<List<FichaObjetoP>> fichas = rdsp.getAll();
    fichas.then((listOfFichas) {
      for (var fichaObjeto in listOfFichas) {
        print('Attribute 1: ${fichaObjeto.ubicacion}');
        print('Attribute 2: ${fichaObjeto.ownerId}');
        // Add more print statements for other attributes as needed
      }
    }).catchError((error) {
      print('Error fetching FichaObjetoP: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    lista = [
      Pertenencia(
          id: 0,
          dueno: 'Carlos Villareal',
          nombre: 'Reloj',
          color: 'Plateado',
          marca: 'Rolex',
          categoria: 'Joyeria',
          modelo: 'Explorer',
          descripcion:
              'La ultima vez que recuerdo verlo visto fue en el comedor del campus uaz siglo XXI',
          foto:
              'https://emwa.com.mx/wp-content/uploads/2023/05/m124270-0001_collection_upright_landscape.jpg'),
      Pertenencia(
          id: 1,
          dueno: 'Gerardo Rodriguez',
          nombre: 'Laptop',
          color: 'Blanco',
          marca: 'HP',
          categoria: 'Electronicos',
          modelo: 'Pavillon',
          descripcion:
              'Se quedo en una mochila dentro del cafe acropolis pero cuando regrese por ella ya no la vi',
          foto:
              'https://i5.walmartimages.com.mx/mg/gm/3pp/asr/4178a577-a23b-4735-b245-c78f72f46bf2.fb9b637239bc097ef06b0bf93c9b7c3a.png?odnHeight=612&odnWidth=612&odnBg=FFFFFF'),
      Pertenencia(
          id: 2,
          dueno: 'Natanael Perez',
          nombre: 'Mochila',
          color: 'Negro',
          marca: 'Nike',
          categoria: 'Mochilas',
          modelo: 'Casual',
          descripcion:
              'Fue llevada al incufidez y cuando se regreso ya no se encontro',
          foto:
              'https://http2.mlstatic.com/D_NQ_NP_684125-MLU70092217848_062023-O.webp'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Publicaciones"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            final item = lista[index];
            return Pertenencia(
                id: item.id,
                dueno: item.dueno,
                nombre: item.nombre,
                color: item.color,
                marca: item.marca,
                modelo: item.modelo,
                descripcion: item.descripcion,
                foto: item.foto);
          },
        ),
      ),
    );
  }
}
