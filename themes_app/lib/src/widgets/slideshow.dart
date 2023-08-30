import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool indicadorArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {super.key,
      this.slides = const [],
      this.indicadorArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlideshowModel(),
      child: SafeArea(child: Builder(
        builder: (BuildContext context) {
          Provider.of<_SlideshowModel>(context).colorPrimario = colorPrimario;
          Provider.of<_SlideshowModel>(context).colorSecundario =
              colorSecundario;

          Provider.of<_SlideshowModel>(context).bulletPrimario = bulletPrimario;
          Provider.of<_SlideshowModel>(context).bulletSecundario =
              bulletSecundario;

          return _EstructuraSlideshow(
              indicadorArriba: indicadorArriba,
              slides: slides,
              colorPrimario: colorPrimario,
              colorSecundario: colorSecundario);
        },
      )),
    );
  }
}

class _EstructuraSlideshow extends StatelessWidget {
  const _EstructuraSlideshow({
    required this.indicadorArriba,
    required this.slides,
    required this.colorPrimario,
    required this.colorSecundario,
  });

  final bool indicadorArriba;
  final List<Widget> slides;
  final Color colorPrimario;
  final Color colorSecundario;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (indicadorArriba) _Dots(slidesLength: slides.length),
        Expanded(child: _Slides(slides: slides)),
        if (!indicadorArriba) _Dots(slidesLength: slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesLength;

  const _Dots({
    this.slidesLength = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(slidesLength, (index) => _Dot(index: index))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot({this.index = 0});

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: (slideShowModel.currentPage == index)
          ? slideShowModel.bulletPrimario
          : slideShowModel.bulletSecundario,
      height: (slideShowModel.currentPage == index)
          ? slideShowModel.bulletPrimario
          : slideShowModel.bulletSecundario,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: (slideShowModel.currentPage >= index - 0.5 &&
                  slideShowModel.currentPage < index + 0.5)
              ? slideShowModel.colorPrimario
              : slideShowModel.colorSecundario,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({this.slides = const []});

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(_pageViewListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _pageViewListener() {
    Provider.of<_SlideshowModel>(context, listen: false).currentPage =
        pageController.page!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  // ignore: prefer_const_constructors_in_immutables
  _Slide({
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30.0),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 12;

  double get currentPage => _currentPage;
  Color get colorPrimario => _colorPrimario;
  Color get colorSecundario => _colorSecundario;
  double get bulletPrimario => _bulletPrimario;
  double get bulletSecundario => _bulletSecundario;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  set colorPrimario(Color value) {
    _colorPrimario = value;
  }

  set colorSecundario(Color value) {
    _colorSecundario = value;
  }

  set bulletPrimario(double value) {
    _bulletPrimario = value;
  }

  set bulletSecundario(double value) {
    _bulletSecundario = value;
  }
}
