import 'package:flutter/material.dart';

class Pag extends StatefulWidget {
  const Pag({super.key});

  @override
  State<Pag> createState() => _PagState();
}

class _PagState extends State<Pag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plantilla paginas"),
      ),
    );
  }
}
