import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        body: Center(),
        floatingActionButton: _MyFloatingButton(),
        bottomNavigationBar: _MyBottomNavigationBar(),
      ),
    );
  }
}

class _MyFloatingButton extends StatelessWidget {
  _MyFloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.pink,
        child: FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          final provider =
              Provider.of<_NotificationModel>(context, listen: false);

          provider.animate = true;

          int number = provider.number;

          provider.number = number + 1;
        });
  }
}

class _MyBottomNavigationBar extends StatelessWidget {
  _MyBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_NotificationModel>(context);
    final int number = provider.number;
    final bool animate = provider.animate;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              label: 'Bones', icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              label: 'Notifications',
              icon: Stack(
                children: [
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: BounceInDown(
                      from: 10.0,
                      animate: animate,
                      controller: (controller) => provider.number > 0
                          ? provider.animationController = controller
                          : null,
                      child: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text('$number',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.0)),
                      ),
                    ),
                  )
                ],
              )),
          BottomNavigationBarItem(
              label: 'My Dog', icon: FaIcon(FontAwesomeIcons.dog)),
        ]);
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  bool _animate = false;
  late AnimationController _animationController;

  int get number => _number;

  bool get animate => _animate;

  AnimationController get animationController => _animationController;

  set number(int value) {
    _number = value;
    notifyListeners();
  }

  set animate(bool value) {
    _animate = value;
    notifyListeners();
  }

  set animationController(AnimationController controller) {
    _animationController = controller;
    notifyListeners();
  }
}
