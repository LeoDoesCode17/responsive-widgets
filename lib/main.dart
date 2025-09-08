import 'package:flutter/material.dart';
import 'package:responsive_widgets/pages/home_page.dart';
import 'package:responsive_widgets/pages/responsive_widget_pages.dart';
import 'package:responsive_widgets/pages/inherited_widget_page.dart';

void main() {
  runApp(const ResponsiveWidgetApp());
}

class ResponsiveWidgetApp extends StatelessWidget {
  const ResponsiveWidgetApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Widget App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/layout-builder': (BuildContext context) => const LayoutBuilderPage(),
        '/media-query': (BuildContext context) => const MediaQueryPage(),
        '/expanded': (BuildContext context) => const ExpandedPage(),
        '/flexible': (BuildContext context) => const FlexiblePage(),
        '/aspect-ratio': (BuildContext context) => const AspectRatioPage(),
        '/orientation-builder': (BuildContext context) =>
            const OrientationBuilderPage(),
        '/wrap': (BuildContext context) => const WrapPage(),
        '/inherited': (BuildContext context) => const InheritedWidgetPage(),
      },
    );
  }
}
