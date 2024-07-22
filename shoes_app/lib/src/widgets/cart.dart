import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/index.dart';

class Cart extends StatelessWidget {
  final double amount;

  Cart({
    this.amount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.15),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 20.0),
          Text(
            "\$$amount",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          CustomButton(text: 'Add to cart'),
        ],
      ),
    );
  }
}
