import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/index.dart';

class ShoesPage extends StatelessWidget {
  ShoesPage();

  @override
  Widget build(BuildContext context) {
    Helpers.changeStatusBarDark();

    return Scaffold(
        body: Column(
      children: [
        CustomAppbar(text: 'For You'),
        SizedBox(height: 12.0),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(
                  tag: 'shoe-1',
                  child: ShoeSize(),
                ),
                SizedBox(height: 12.0),
                ShoeDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
              ],
            ),
          ),
        ),
        Cart(),
      ],
    ));
  }
}
