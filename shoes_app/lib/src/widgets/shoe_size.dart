import 'package:flutter/material.dart';

class ShoeSize extends StatelessWidget {
  ShoeSize();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 430.0,
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Color(0XFFF8D468),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Column(
        children: [
          _ShoeWithShadow(),
          _Sizes(),
        ],
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  _ShoeWithShadow();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, bottom: 16.0, left: 50.0, right: 50.0),
      child: Stack(
        children: [
          _ShoeShadow(),
          Image(
            image: AssetImage('assets/imgs/azul.png'),
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
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _Size(
          size: '20',
          index: 0,
          isSelected: _selectedIndex == 0,
          onHandleTap: _onHandleTap,
        ),
        _Size(
          size: '22',
          index: 1,
          isSelected: _selectedIndex == 1,
          onHandleTap: _onHandleTap,
        ),
        _Size(
          size: '24',
          index: 2,
          isSelected: _selectedIndex == 2,
          onHandleTap: _onHandleTap,
        ),
        _Size(
          size: '26',
          index: 3,
          isSelected: _selectedIndex == 3,
          onHandleTap: _onHandleTap,
        ),
        _Size(
          size: '28',
          index: 4,
          isSelected: _selectedIndex == 4,
          onHandleTap: _onHandleTap,
        ),
        _Size(
          size: '30',
          index: 5,
          isSelected: _selectedIndex == 5,
          onHandleTap: _onHandleTap,
        ),
      ],
    );
  }

  void _onHandleTap(int index, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedIndex = -1;
      } else {
        _selectedIndex = index;
      }
    });
  }
}

class _Size extends StatelessWidget {
  final String size;
  final int index;
  final bool isSelected;
  final void Function(int index, bool isSelected) onHandleTap;

  _Size({
    required this.size,
    required this.index,
    required this.onHandleTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onHandleTap(index, isSelected),
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
            size,
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
