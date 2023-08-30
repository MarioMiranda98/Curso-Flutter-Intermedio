import 'package:animaciones_con_animate_do/src/pages/navigation_page.dart';
import 'package:animaciones_con_animate_do/src/pages/twitter_page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatelessWidget {
  FirstPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Animate Do'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => TwitterPage(),
                  ),
                );
              },
              icon: FaIcon(FontAwesomeIcons.twitter),
            ),
            SlideInLeft(
              from: 100.0,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => FirstPage(),
                      ),
                    );
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.arrowRight,
                  )),
            )
          ],
        ),
        floatingActionButton: ElasticInRight(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => NavigationPage(),
                ),
              );
            },
            child: FaIcon(FontAwesomeIcons.play),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1750),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 36.0,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 250),
              child: Text(
                'Titulo',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 750),
              child: Text(
                'Soy un texto pequeño',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1250),
              child: Container(
                width: 220.0,
                height: 2.0,
                color: Colors.blue,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
