import 'package:flutter/material.dart';
import 'package:responsive_widgets/widgets/custom_card.dart';

class LayoutBuilderPage extends StatelessWidget {
  const LayoutBuilderPage({super.key});
  static const List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.brown,
    Colors.pink,
    Colors.red,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder Grid"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Tentukan jumlah kolom berdasarkan lebar parent
          int crossAxisCount = 2; // default untuk layar kecil
          if (constraints.maxWidth > 600) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 400) {
            crossAxisCount = 3;
          }

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount /* Number of column */,
              crossAxisSpacing: 10,
              /* Distance between column */
              mainAxisSpacing: 10 /* Distance between row */,
            ),
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return Container(
                color: colors[index],
                child: Center(
                  child: Text(
                    "Item ${index + 1}",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MediaQueryPage extends StatelessWidget {
  const MediaQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('MediaQuery Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text("""
            Width: ${size.width}, 
            Height: ${size.height}, 
            ${orientation.toString()}
          """, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class ExpandedPage extends StatelessWidget {
  const ExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomCard(
              title: 'Android',
              color: Colors.red,
              icon: Icons.android,
            ),
          ),
          Expanded(
            child: CustomCard(
              title: 'Windows',
              color: Colors.black,
              icon: Icons.window,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomCard(
              title: 'Windows',
              color: Colors.yellow,
              icon: Icons.apple,
            ),
          ),
          // Expanded(
          //   flex: 2,
          //   child: CustomCard(
          //     title: 'Apple',
          //     color: Colors.amber,
          //     icon: Icons.apple,
          //   ),
          // ),
          // Expanded(
          //   child: CustomCard(
          //     title: 'Windows',
          //     color: Colors.blue,
          //     icon: Icons.window,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FlexiblePage extends StatelessWidget {
  const FlexiblePage({super.key});

  Widget firstExample() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CustomCard(
            title: 'Android',
            color: Colors.red,
            icon: Icons.android,
          ),
        ),
      ],
    );
  }

  Widget secondExample() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.yellow,
                  margin: EdgeInsets.all(2.5),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  margin: EdgeInsets.all(2.5),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.purple,
                  margin: EdgeInsets.all(2.5),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(color: Colors.green, margin: EdgeInsets.all(2.5)),
        ),
        Flexible(
          flex: 1,
          child: Container(color: Colors.blue, margin: EdgeInsets.all(2.5)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: firstExample(),
    );
  }
}

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.orange,
            child: Center(child: Text("16:9 Box")),
          ),
        ),
      ),
    );
  }
}

class OrientationBuilderPage extends StatelessWidget {
  const OrientationBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationBuilder Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Center(child: Text("Mode Portrait"));
          } else {
            return Center(child: Text("Mode Landscape"));
          }
        },
      ),
    );
  }
}

class WrapPage extends StatelessWidget {
  const WrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0,
          /* distance between item in the same row */
          runSpacing: 4.0,
          /* distance between line (row) */
          children: List.generate(
            20,
            (index) => Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue.shade900,
                child: Text('${index + 1}'),
              ),
              label: Text('Item ${index + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
