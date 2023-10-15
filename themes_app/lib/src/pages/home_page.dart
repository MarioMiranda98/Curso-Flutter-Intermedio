import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:themes_app/src/routes/routes.dart';
import 'package:themes_app/src/theme/theme.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
        backgroundColor: appTheme.currentTheme.colorScheme.background,
      ),
      drawer: _MainMenu(),
      body: _OptionsList(),
    ));
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appThemes = Provider.of<ThemeChanger>(context);

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) =>
          Divider(color: appThemes.currentTheme.primaryColorLight),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon,
            color: appThemes.currentTheme.colorScheme.secondary),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right,
            color: appThemes.currentTheme.colorScheme.secondary),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    return Drawer(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200.0,
              child: CircleAvatar(
                backgroundColor:
                    themeProvider.currentTheme.colorScheme.secondary,
                child: Text('MS', style: TextStyle(fontSize: 50.0)),
              ),
            ),
            Expanded(child: _OptionsList()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,
                  color: themeProvider.currentTheme.colorScheme.secondary),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: themeProvider.currentTheme.colorScheme.secondary,
                  value: themeProvider.darkTheme,
                  onChanged: (value) {
                    themeProvider.darkTheme = value;
                  }),
            ),
            SafeArea(
              bottom: true,
              right: false,
              left: false,
              top: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen,
                    color: themeProvider.currentTheme.colorScheme.secondary),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                    activeColor:
                        themeProvider.currentTheme.colorScheme.secondary,
                    value: themeProvider.customTheme,
                    onChanged: (value) {
                      themeProvider.customTheme = value;
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
