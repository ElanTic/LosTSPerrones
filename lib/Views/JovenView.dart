import 'package:flutter/material.dart';

class JovenView extends StatefulWidget {
  const JovenView({Key? key}) : super(key: key);

  @override
  _JovenViewState createState() => _JovenViewState();
}

class _JovenViewState extends State<JovenView> {
  //late HomePageModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Juvem")),
    );
  }
}
