import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itemtrackers/models/FichaObjetoP.dart';
import 'package:itemtrackers/rest/RDS_Publicacion.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late Future<FichaObjetoP> futureFichaObjetoP;

  @override
  void initState() {
    super.initState();
    RDS_Publicacion rdsp = RDS_Publicacion();
    futureFichaObjetoP = rdsp.getFichaObjetoP('1');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<FichaObjetoP>(
            future: futureFichaObjetoP,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.ownerId);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
