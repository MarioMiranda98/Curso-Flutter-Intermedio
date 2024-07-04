import 'package:flutter/material.dart';
import 'package:disenios_lpt/src/theme/theme.dart';

import 'package:disenios_lpt/src/widgets/pinterest_grid_widget.dart';
import 'package:disenios_lpt/src/widgets/pinterest_menu.dart';
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
    final appTheme = Provider.of<ThemeChanger>(context);
    double screenWidth = 0;

    if (mq.size.width > 500) {
      screenWidth = mq.size.width - 300;
    } else {
      screenWidth = mq.size.width;
    }

    return Positioned(
      bottom: 30.0,
      child: SizedBox(
        width: screenWidth,
        child: Row(
          children: [
            Spacer(),
            PinterestMenu(
                activeColor: appTheme.currentTheme.colorScheme.secondary,
                // inactiveColor: Colors.blueGrey[200]!,
                backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
                showMenu: menuModelProvider.showMenu,
                items: [
                  PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
                  PinterestButton(onPressed: () {}, icon: Icons.search),
                  PinterestButton(onPressed: () {}, icon: Icons.notifications),
                  PinterestButton(
                      onPressed: () {}, icon: Icons.supervised_user_circle),
                ]),
            Spacer(),
          ],
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
