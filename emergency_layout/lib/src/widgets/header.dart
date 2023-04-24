import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color startGradientColor;
  final Color endGradientColor;
  final transparentWhite = Colors.white.withOpacity(0.7);

  Header({
    this.startGradientColor = const Color(0XFF526BF6),
    this.endGradientColor = const Color(0XFF67ACF2),
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderBackground(
          startGradientColor: startGradientColor,
          endGradientColor: endGradientColor,
        ),
        Positioned(
          top: -50,
          left: -60,
          child:
              FaIcon(icon, size: 225.0, color: Colors.white.withOpacity(0.2)),
        ),
        Column(
          children: [
            SizedBox(height: 80.0, width: double.infinity),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 20.0,
                color: transparentWhite,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              title,
              style: TextStyle(
                  fontSize: 24.0,
                  color: transparentWhite,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            FaIcon(
              icon,
              size: 80.0,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final Color startGradientColor;
  final Color endGradientColor;

  _HeaderBackground(
      {required this.startGradientColor, required this.endGradientColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                startGradientColor,
                endGradientColor,
              ])),
    );
  }
}
