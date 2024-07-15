import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/index.dart';

class ShoesPage extends StatelessWidget {
  ShoesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppbar(text: 'For You'),
        SizedBox(height: 12.0),
        ShoeSize(),
      ],
    ));
  }
}
