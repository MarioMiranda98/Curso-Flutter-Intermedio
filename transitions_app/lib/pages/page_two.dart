import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  PageTwo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 2')),
      backgroundColor: Colors.green,
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
