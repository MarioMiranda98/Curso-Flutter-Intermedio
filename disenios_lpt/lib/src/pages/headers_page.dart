import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenios_lpt/src/theme/theme.dart';

import 'package:disenios_lpt/src/widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Scaffold(
        body: HeaderWaves(color: appTheme.currentTheme.colorScheme.secondary));
  }
}
