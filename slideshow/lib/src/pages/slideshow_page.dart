import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:slideshow/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: _MiSlideshow()),
          Expanded(child: _MiSlideshow())
        ],
      )
    );
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow();

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      indicadorArriba: true,
      slides: <Widget> [
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg'),
      ],
    );
  }
}