import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pinterest_layout/src/pages/home_page.dart';
import 'package:pinterest_layout/src/widgets/pinterest_item.dart';

class PinterestGridWidget extends StatefulWidget {
  @override
  State<PinterestGridWidget> createState() => _PinterestGridWidgetState();
}

class _PinterestGridWidgetState extends State<PinterestGridWidget> {
  late ScrollController controller;
  late double _pastScroll;
  late MenuModel menuModelProvider;
  final List<int> items = List.generate(200, (index) => index);

  @override
  void initState() {
    _pastScroll = 0;
    controller = ScrollController();
    menuModelProvider = Provider.of<MenuModel>(context, listen: false);

    controller.addListener(_scrollControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollControllerListener() {
    if (controller.offset > _pastScroll) {
      menuModelProvider.showMenu = false;
    } else {
      menuModelProvider.showMenu = true;
    }
    _pastScroll = controller.offset;
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
