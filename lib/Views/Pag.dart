import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/Joven.dart';
import 'package:itemtrackers/rest/RDS_joven.dart';

class Pag extends StatefulWidget {
  const Pag({super.key});

  @override
  State<Pag> createState() => _PagState();
}

class _PagState extends State<Pag> {
  late Future<Joven> futureJoven;

  @override
  void initState() {
    super.initState();
    RDS_joven rdsj = RDS_joven();

    futureJoven = rdsj.getJoven("Jane Doe");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Center(
        child: FutureBuilder<Joven>(
          future: futureJoven,
          builder: (context, snapshot) {
            String? tel = "";
            if (snapshot.hasData) {
              if (snapshot.data?.telefono != null) {
                tel = snapshot.data?.telefono;
              }
              return Text(snapshot.data!.nombre + " mi telefono es " + tel!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
