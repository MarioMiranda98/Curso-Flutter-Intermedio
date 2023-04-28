import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: _NewListButton(),
          ),
        ],
      ),
    ));
  }
}

class _NewListButton extends StatelessWidget {
  _NewListButton();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(Size(mq.size.width * 0.9, 100.0)),
            maximumSize:
                MaterialStateProperty.all(Size(mq.size.width * 0.9, 100.0)),
            backgroundColor: MaterialStateProperty.all(const Color(0XFFED6762)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(50.0))))),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Create new list',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3)),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  _MainScroll();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            maxHeight: 250.0,
            minHeight: 200.0,
            child: Container(color: Colors.white, child: _Header()),
          ),
        ),
        SliverList(
            delegate:
                SliverChildListDelegate([...items, SizedBox(height: 100.0)])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.maxHeight, required this.minHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Text(
            'New',
            style: TextStyle(color: Color(0XFF532128), fontSize: 50.0),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 130.0),
            Positioned(
              bottom: 8.0,
              child: Container(
                width: 130.0,
                height: 8.0,
                decoration: BoxDecoration(color: Color(0XFFF7CDD5)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'List',
                style: TextStyle(
                  color: Color(0XFFD93A30),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// class _ThingsList extends StatelessWidget {
//   final items = [
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//   ];

//   _ThingsList();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (BuildContext context, int index) => items[index],
//     );
//   }
// }

class _ListItem extends StatelessWidget {
  const _ListItem(this.title, this.color);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 130.0,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color,
      ),
      child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0)),
    );
  }
}
