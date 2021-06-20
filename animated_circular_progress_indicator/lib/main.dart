import 'package:flutter/material.dart';

import 'package:animated_circular_progress_indicator/src/pages/graficas_circulares_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: GraficasCircularesPage(),
    );
  }
}