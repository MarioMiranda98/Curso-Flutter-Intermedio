import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  ShoeDescription({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.0),
          Text(
            description,
            style: TextStyle(
              color: Colors.black54,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
