import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    required this.icon,
    required this.onPressed,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  final Color backgroundColor;

  // final List<PinterestButton> items = [
  //   PinterestButton(onPressed: () {}, icon: Icons.pie_chart),
  //   PinterestButton(onPressed: () {}, icon: Icons.search),
  //   PinterestButton(onPressed: () {}, icon: Icons.notifications),
  //   PinterestButton(onPressed: () {}, icon: Icons.supervised_user_circle),
  // ];

  PinterestMenu({
    this.showMenu = true,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    this.backgroundColor = Colors.white,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: showMenu ? 1 : 0,
        child: _PinterestMenuBackground(
          backgroundColor: backgroundColor,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          widget: _MenuItems(
            menuItems: items,
          ),
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget widget;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  const _PinterestMenuBackground(
      {required this.widget,
      required this.activeColor,
      required this.backgroundColor,
      required this.inactiveColor});

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModel>(context, listen: false);
    menuModelProvider.activeColor = activeColor;
    menuModelProvider.inactiveColor = inactiveColor;
    return Container(
      width: 250.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10.0, spreadRadius: -5)
          ]),
      child: widget,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems({this.menuItems = const []});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length,
          (index) =>
              _PinterestMenuButton(index: index, item: menuItems[index])),
    ));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton({this.index = 0, required this.item});

  @override
  Widget build(BuildContext context) {
    final menuModelProvider = Provider.of<_MenuModel>(context);
    final isSelected = menuModelProvider.selectedItem == index;

    return GestureDetector(
      onTap: () {
        menuModelProvider.selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        child: Icon(item.icon,
            size: isSelected ? 35.0 : 25.0,
            color: isSelected
                ? menuModelProvider.activeColor
                : menuModelProvider.inactiveColor),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get selectedItem => _selectedItem;
  Color get activeColor => _activeColor;
  Color get inactiveColor => _inactiveColor;

  set selectedItem(int value) {
    _selectedItem = value;
    notifyListeners();
  }

  set activeColor(Color value) {
    _activeColor = value;
  }

  set inactiveColor(Color value) {
    _inactiveColor = value;
  }
}
