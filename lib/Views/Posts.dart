import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itemtrackers/Views/Formulario.dart';
import 'package:itemtrackers/Views/Objetos.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Pertenencia.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';
import 'package:itemtrackers/rest/RDS_pertenencia.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  //late HomePageModel _model;
  late Future<List<Pertenencia>> fichas;

  @override
  void initState() {
    super.initState();

    RDS_pertenencia rdsp = RDS_pertenencia();
    fichas = rdsp.getAll();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pertenencia>>(
      future: fichas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Pertenencia> pertenencias = snapshot.data!;
          return ListView.builder(
            itemCount: pertenencias.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(pertenencias[index].nombre),
                // Add more widgets to display other properties of Pertenencia
              );
            },
          );
        }
      },
    );
  }
}
