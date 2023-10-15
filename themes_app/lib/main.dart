import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/pages/home_page.dart';
import 'package:themes_app/src/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeChanger(2), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.currentTheme,
      home: HomePage(),
    );
  }
}
