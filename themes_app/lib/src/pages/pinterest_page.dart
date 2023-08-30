import 'package:flutter/material.dart';

import 'package:themes_app/src/widgets/pinterest_grid_widget.dart';
import 'package:themes_app/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          body: ChangeNotifierProvider(
        create: (_) => MenuModel(),
        child: Stack(
          children: [PinterestGridWidget(), _PinterestMenuHolder(mq: mq)],
        ),
      )),
    );
  }
}

class _PinterestMenuHolder extends StatelessWidget {
  const _PinterestMenuHolder({
    required this.mq,
  });

  final MediaQueryData mq;

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<MenuModel>(context);
    return Positioned(
      bottom: 30.0,
      child: SizedBox(
        width: mq.size.width,
        child: Align(
          child: PinterestMenu(
              // activeColor: Colors.teal[900]!,
              // inactiveColor: Colors.blueGrey[200]!,
              showMenu: menuModelProvider.showMenu,
              items: [
                PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
                PinterestButton(onPressed: () {}, icon: Icons.search),
                PinterestButton(onPressed: () {}, icon: Icons.notifications),
                PinterestButton(
                    onPressed: () {}, icon: Icons.supervised_user_circle),
              ]),
        ),
      ),
    );
  }
}

class MenuModel with ChangeNotifier {
  bool _showMenu = true;

  bool get showMenu => _showMenu;

  set showMenu(bool value) {
    _showMenu = value;
    notifyListeners();
  }
}
