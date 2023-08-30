import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:themes_app/src/labs/slideshow_page.dart';
import 'package:themes_app/src/pages/cuadrado_animado_page.dart';
import 'package:themes_app/src/pages/emergency_page.dart';
import 'package:themes_app/src/pages/graficas_circulares_page.dart';
import 'package:themes_app/src/pages/headers_page.dart';
import 'package:themes_app/src/pages/pinterest_page.dart';
import 'package:themes_app/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route(
      icon: FontAwesomeIcons.slideshare,
      title: 'SlideShow',
      page: SlideshowPage()),
  _Route(
      icon: FontAwesomeIcons.truckMedical,
      title: 'Emergencia',
      page: EmergencyPage()),
  _Route(
      icon: FontAwesomeIcons.heading,
      title: 'Encabezados',
      page: HeadersPage()),
  _Route(
      icon: FontAwesomeIcons.peopleCarryBox,
      title: 'Cuadro Animado',
      page: CuadradoAnimadoPage()),
  _Route(
      icon: FontAwesomeIcons.circleNotch,
      title: 'Barra Progeso',
      page: GraficasCircularesPage()),
  _Route(
      icon: FontAwesomeIcons.pinterest,
      title: 'Pinterest',
      page: PinterestPage()),
  _Route(
      icon: FontAwesomeIcons.mobile, title: 'Slivers', page: SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route({required this.icon, required this.title, required this.page});
}
