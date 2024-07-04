import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:disenios_lpt/src/theme/theme.dart';

import 'package:disenios_lpt/src/widgets/slideshow.dart';

// ignore: must_be_immutable
class SlideshowPage extends StatelessWidget {
  bool _isLarge = false;

  SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    if (mq.size.width > 500) {
      _isLarge = true;
    } else {
      _isLarge = false;
    }

    final children = [
      Expanded(child: _MiSlideshow()),
      Expanded(child: _MiSlideshow())
    ];

    return Scaffold(
        body: _isLarge ? Column(children: children) : Row(children: children));
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context, listen: false);

    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      indicadorArriba: true,
      colorPrimario: appTheme.darkTheme
          ? appTheme.currentTheme.colorScheme.secondary
          : Color(0XFFFF5A7E),
      colorSecundario: appTheme.darkTheme
          ? appTheme.currentTheme.primaryColorLight
          : Colors.blue,
      slides: <Widget>[
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg'),
      ],
    );
  }
}
