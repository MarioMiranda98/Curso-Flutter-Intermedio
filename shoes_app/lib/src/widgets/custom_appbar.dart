import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String text;

  CustomAppbar({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          margin: EdgeInsets.only(top: 30.0),
          width: double.infinity,
          child: Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Icon(Icons.search, size: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
