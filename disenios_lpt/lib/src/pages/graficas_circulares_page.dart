import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenios_lpt/src/theme/theme.dart';

import 'package:disenios_lpt/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.25, color: Colors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.5, color: Colors.pink),
              CustomRadialProgress(
                  porcentaje: porcentaje * 1.75, color: Colors.purple),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (porcentaje >= 100) porcentaje = 0.0;

            porcentaje += 10.0;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      width: 180.0,
      height: 180.0,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario:
            appTheme.currentTheme.textTheme.bodyLarge?.color ?? Colors.black,
      ),
    );
  }
}
