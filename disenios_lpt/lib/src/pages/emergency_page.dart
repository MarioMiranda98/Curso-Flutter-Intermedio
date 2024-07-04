import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:disenios_lpt/src/widgets/big_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenios_lpt/src/widgets/header.dart';

class ItemBoton {
  final IconData icon;
  final String buttonText;
  final Color startGradientColor;
  final Color endGradientColor;

  ItemBoton(this.icon, this.buttonText, this.startGradientColor,
      this.endGradientColor);
}

// ignore: must_be_immutable
class EmergencyPage extends StatelessWidget {
  bool _isLarge = false;

  final items = <ItemBoton>[
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
        Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
        Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident', Color(0xff6989F5),
        Color(0xff906EF5)),
    ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    ItemBoton(FontAwesomeIcons.personBiking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    if (mq.size.height > 550) {
      _isLarge = true;
    } else {
      _isLarge = false;
    }
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 220.0),
            child: ListView(physics: BouncingScrollPhysics(), children: [
              SizedBox(height: 90.0),
              ...items
                  .map((e) => FadeInLeft(
                        duration: Duration(milliseconds: 250),
                        child: BigButton(
                            icon: e.icon,
                            buttonText: e.buttonText,
                            startGradientColor: e.startGradientColor,
                            endGradientColor: e.endGradientColor,
                            onPressed: () {
                              print(e.buttonText);
                            }),
                      ))
                  .toList()
            ]),
          ),
          if (_isLarge) _PageHeader(),
        ],
      )),
    );
  }
}

class _PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Header(
          title: 'Asistencia Médica',
          subTitle: 'Haz solicitado',
          icon: FontAwesomeIcons.plus,
        ),
        Positioned(
            right: 0.0,
            top: 25.0,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15.0),
              child: FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
