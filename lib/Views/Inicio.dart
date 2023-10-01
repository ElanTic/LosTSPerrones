import 'package:flutter/material.dart';
//import 'package:itemtrackers/Views/C_nav_bar.dart';
import 'package:itemtrackers/Views/NavBarC.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavBarC(),
    );
  }
}
