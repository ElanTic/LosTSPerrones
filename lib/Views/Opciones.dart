import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itemtrackers/Views/Formulario.dart';
import 'package:itemtrackers/Views/Objetos.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/models/Pertenencia.dart';
import 'JovenView.dart';
import 'Posts.dart';

class Opciones extends StatefulWidget {
  const Opciones({Key? key}) : super(key: key);

  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Opciones',
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FloatingActionButton.extended(
                heroTag: "usr_detail",
                label: Text('Mi Cuenta'),
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.account_box,
                  size: 60.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            JovenView()), // Assuming JovenView is the target page
                  );
                },
              ),
              FloatingActionButton.extended(
                heroTag: "usr_stuff",
                label: Text('Mis cosas'),
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.archive,
                  size: 60.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Objetos()), // Assuming Objetos is the target page
                  );
                },
              ),
              FloatingActionButton.extended(
                heroTag: "user_pub",
                label: Text('Mis publicaciones'),
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.description,
                  size: 60.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Posts()), // Assuming Posts is the target page
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
