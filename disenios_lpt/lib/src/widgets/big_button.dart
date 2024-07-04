import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BigButton extends StatelessWidget {
  final IconData icon;
  final String buttonText;
  final Color startGradientColor;
  final Color endGradientColor;
  final void Function() onPressed;

  BigButton(
      {this.startGradientColor = const Color(0XFF6989F5),
      this.endGradientColor = const Color(0XFF906EF5),
      required this.icon,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          _BigButtonBackground(
            icon: icon,
            startGradientColor: startGradientColor,
            endGradientColor: endGradientColor,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: mq.size.width - 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 140.0, width: 40.0),
                FaIcon(
                  icon,
                  size: 40.0,
                  color: Colors.white,
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BigButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color startGradientColor;
  final Color endGradientColor;

  const _BigButtonBackground({
    required this.icon,
    required this.startGradientColor,
    required this.endGradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4.0, 6.0),
              blurRadius: 10.0,
            )
          ],
          gradient: LinearGradient(colors: <Color>[
            startGradientColor,
            endGradientColor,
          ])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150.0,
                  color: Colors.white.withOpacity(0.2),
                )),
          ],
        ),
      ),
    );
  }
}
