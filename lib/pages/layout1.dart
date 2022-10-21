import 'package:flutter/material.dart';

class LayoutSample1 extends StatelessWidget {
  LayoutSample1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
        height: 800,
        child: Column(
          children: [
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 440,
                    child: leftColumn(context),
                  ),
                  const Expanded(child: Text("main image")),
                ],
              ),
            ),
            _buildImageColumn(),
          ],
        ),
      ),
    );
  }

  Widget leftColumn(BuildContext context) => Container(
        child: Column(
          children: [
            const Text(
              "Strawberry Pavlova",
            ),
            const Text(
                "Pavlova is meringue_based dessert named after the Russian ballening Anna Pavlova"),
            ratings,
            iconList,
          ],
        ),
      );

  static const descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 2,
    fontSize: 18,
    height: 2,
  );

  static var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );

  static final ratings = Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stars,
        const Text(
          '170 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
  static final iconList = DefaultTextStyle.merge(
    style: descTextStyle,
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green[500]),
              const Text('PREP:'),
              const Text('25 min'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer, color: Colors.green[500]),
              const Text('COOK:'),
              const Text('1 hr'),
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green[500]),
              const Text('FEEDS:'),
              const Text('4-6'),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(children: [
        _buildDecoratedImage(1),
        _buildDecoratedImage(2),
      ]),
    );
  }

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 10,
              color: Colors.black38,
            ),
          ),
          margin: const EdgeInsets.all(4),
          child: Text("index: $imageIndex"),
        ),
      );
}
