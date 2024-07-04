import 'package:disenios_lpt/src/models/layout_model.dart';
import 'package:disenios_lpt/src/pages/home_page.dart';
import 'package:disenios_lpt/src/pages/home_tablet_page.dart';
import 'package:disenios_lpt/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeChanger(2), child: const MyApp()),
      ChangeNotifierProvider(create: (_) => LayoutModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Disenios LPT',
      theme: appTheme.currentTheme,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return Container(child: HomeTabletPage());
          } else {
            return Container(child: HomePage());
          }
        },
      ),
    );
  }
}
