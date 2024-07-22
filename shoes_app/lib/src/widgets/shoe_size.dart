import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/shoe_desc_page.dart';

class ShoeSize extends StatelessWidget {
  final bool fullScreen;

  ShoeSize({
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onHandleTap(context),
      child: Container(
        width: double.infinity,
        height: 430.0,
        margin: fullScreen
            ? EdgeInsets.symmetric(horizontal: 5.0)
            : EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 5.0,
              ),
        decoration: BoxDecoration(
          color: Color(0XFFF8D468),
          borderRadius: BorderRadius.circular(fullScreen ? 40.0 : 50.0),
        ),
        child: Column(
          children: [
            _ShoeWithShadow(),
            if (!fullScreen) _Sizes(),
          ],
        ),
      ),
    );
  }

  void _onHandleTap(BuildContext context) {
    if (!fullScreen) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => ShoeDescPage()));
    }
  }
}

class _ShoeWithShadow extends StatelessWidget {
  _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: 16.0, left: 50.0, right: 50.0),
      child: Stack(
        children: [
          _ShoeShadow(),
          Image(
            image: AssetImage(shoeModel.assetImage),
          )
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 0.0,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 250.0,
          height: 135.0,
          decoration: (BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.75), blurRadius: 40.0),
            ],
          )),
        ),
      ),
    );
  }
}

class _Sizes extends StatefulWidget {
  _Sizes();

  @override
  State<_Sizes> createState() => _SizesState();
}

class _SizesState extends State<_Sizes> {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _Size(
          size: 20,
          index: 0,
          isSelected: shoeModel.size == 20,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
        _Size(
          size: 22,
          index: 1,
          isSelected: shoeModel.size == 22,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
        _Size(
          size: 24,
          index: 2,
          isSelected: shoeModel.size == 24,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
        _Size(
          size: 26,
          index: 3,
          isSelected: shoeModel.size == 26,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
        _Size(
          size: 28,
          index: 4,
          isSelected: shoeModel.size == 28,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
        _Size(
          size: 30,
          index: 5,
          isSelected: shoeModel.size == 30,
          onHandleTap: (double size, bool isSelected) =>
              _onHandleTap(context, size, isSelected),
        ),
      ],
    );
  }

  void _onHandleTap(BuildContext context, double size, bool isSelected) {
    final shoeModel = Provider.of<ShoeModel>(context, listen: false);
    if (isSelected) {
      shoeModel.size = -1;
    } else {
      shoeModel.size = size.toDouble();
    }
  }
}

class _Size extends StatelessWidget {
  final double size;
  final int index;
  final bool isSelected;
  final void Function(double size, bool isSelected) onHandleTap;

  _Size({
    required this.size,
    required this.index,
    required this.onHandleTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onHandleTap(size, isSelected),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
          color: isSelected ? Color(0XFFF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Color(0XFFF1A23A),
                    blurRadius: 10.0,
                    offset: Offset(1.0, 8.0),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            size.toStringAsFixed(0),
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0XFFF1A23A),
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
