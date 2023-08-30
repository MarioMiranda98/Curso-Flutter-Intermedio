import 'package:flutter/material.dart';

import 'package:animaciones_con_animate_do/src/pages/fisrt_page.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animaciones Con Animate Do',
      home: FirstPage(),
    );
  }
}
