import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool _activate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF1DA1F2),
      body: Center(
        child: ZoomOut(
            from: 30.0,
            animate: _activate,
            duration: Duration(seconds: 1),
            child: FaIcon(FontAwesomeIcons.twitter,
                color: Colors.white, size: 40.0)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _activate = true;
        }),
        backgroundColor: Colors.pinkAccent,
        child: FaIcon(FontAwesomeIcons.play),
      ),
    );
  }
}
