import 'package:flutter/material.dart';
import 'package:transitions_app/pages/page_one.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}
