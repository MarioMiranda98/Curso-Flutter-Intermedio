import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/index.dart';

class ShoeDescPage extends StatelessWidget {
  ShoeDescPage();

  @override
  Widget build(BuildContext context) {
    Helpers.changeStatusBarLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(tag: 'shoe-1', child: ShoeSize(fullScreen: true)),
              Positioned(
                  top: 60.0,
                  left: 10.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Helpers.changeStatusBarDark();
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 12.0),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  SizedBox(height: 12.0),
                  _AmountAndBuy(
                    amount: '180.0',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AmountAndBuy extends StatelessWidget {
  final String amount;

  _AmountAndBuy({
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "\$$amount",
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Bounce(
                delay: Duration(seconds: 1),
                from: 8,
                child: CustomButton(
                  text: 'Buy Now',
                  width: 120.0,
                  height: 40.0,
                ),
              ),
            ],
          ),
          _ShoeColors(),
          _PreferencesSettings(),
        ],
      ),
    );
  }
}

class _PreferencesSettings extends StatelessWidget {
  const _PreferencesSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _PreferenceButton(
            icon: Icon(
              Icons.star,
              color: Colors.red,
              size: 25.0,
            ),
          ),
          _PreferenceButton(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25.0,
            ),
          ),
          _PreferenceButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceButton extends StatelessWidget {
  final Icon icon;

  const _PreferenceButton({
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 55.0,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20.0,
              offset: Offset(0, 10.0)),
        ],
      ),
      child: icon,
    );
  }
}

class _ShoeColors extends StatelessWidget {
  final String basePath = 'assets/imgs';

  const _ShoeColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90.0,
                  child: _ColorButton(
                    color: Color(0XFFC6D642),
                    index: 4,
                    assetUrl: '$basePath/verde.png',
                  ),
                ),
                Positioned(
                  left: 60.0,
                  child: _ColorButton(
                    color: Color(0XFF2099F1),
                    index: 3,
                    assetUrl: '$basePath/azul.png',
                  ),
                ),
                Positioned(
                  left: 30.0,
                  child: _ColorButton(
                    color: Color(0XFFFFAD29),
                    index: 2,
                    assetUrl: '$basePath/amarillo.png',
                  ),
                ),
                Positioned(
                  child: _ColorButton(
                    color: Color(0XFF364D56),
                    index: 1,
                    assetUrl: '$basePath/negro.png',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomButton(
              text: "More related items",
              height: 30.0,
              width: 170.0,
              color: Color(0XFFFFC675),
            ),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final int index;
  final Color color;
  final String assetUrl;

  const _ColorButton({
    required this.index,
    required this.color,
    required this.assetUrl,
  });

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);
    return FadeInLeft(
      delay: Duration(milliseconds: index * 250),
      duration: Duration(milliseconds: 250),
      child: GestureDetector(
        onTap: () => shoeModel.assetImage = assetUrl,
        child: Container(
          width: 45.0,
          height: 45.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
