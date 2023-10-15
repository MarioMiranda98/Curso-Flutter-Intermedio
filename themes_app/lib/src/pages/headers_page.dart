import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/theme/theme.dart';

import 'package:themes_app/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
        body: HeaderWaves(color: appTheme.currentTheme.colorScheme.secondary));
  }
}
