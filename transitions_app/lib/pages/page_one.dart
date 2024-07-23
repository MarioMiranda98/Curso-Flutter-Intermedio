import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transitions_app/pages/page_two.dart';

class PageOne extends StatelessWidget {
  PageOne();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 1')),
      body: Center(
        child: Text('Page 1'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_time),
        onPressed: () {
          Navigator.push(context, _createRoute());
        },
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          PageTwo(),
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: Offset(1.0, 1.0),
        //     end: Offset.zero,
        //   ).animate(curvedAnimation),
        //   child: child,
        // );

        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.2, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        // return RotationTransition(
        //   turns: Tween<double>(begin: 0.1, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        // return FadeTransition(
        //   opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: child,
          ),
        );
      },
    );
  }
}
