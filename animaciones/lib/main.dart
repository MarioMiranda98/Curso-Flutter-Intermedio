import 'package:flutter/material.dart';

import 'package:animaciones/src/challenge/cuadrado_animado_page.dart';
// import 'package:animaciones/src/pages/animaciones_page.dart'; 

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones',
      home: CuadradoAnimadoPage(),
    );
  }
}