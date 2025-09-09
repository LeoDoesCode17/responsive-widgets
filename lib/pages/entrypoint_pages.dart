import 'package:flutter/material.dart';

class ResponsiveEntryPoint extends StatelessWidget {
  const ResponsiveEntryPoint({super.key});

  static const List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  static const List<String> routes = [
    '/responsive-widget/layout-builder',
    '/responsive-widget/media-query',
    '/responsive-widget/expanded',
    '/responsive-widget/flexible',
    '/responsive-widget/aspect-ratio',
    '/responsive-widget/orientation-builder',
    '/responsive-widget/wrap',
  ];

  static const List<String> labels = [
    'Layout Builder',
    'Media Query',
    'Expanded',
    'Flexible',
    'Aspect Ratio',
    'Orientation Builder',
    'Wrap',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Widget'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
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
            itemBuilder: (context, index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors[index % colors.length],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, routes[index]);
                },
                child: Center(
                  child: Text(
                    labels[index],
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              );
            },
            itemCount: routes.length,
          );
        },
      ),
    );
  }
}
