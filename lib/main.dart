import 'package:flutter/material.dart';
import 'package:responsive_widgets/pages/entrypoint_pages.dart';
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
        '/responsiive-widget': (BuildContext context) => const ResponsiveEntryPoint(),
        '/responsive-widget/layout-builder': (BuildContext context) => const LayoutBuilderPage(),
        '/responsive-widget/media-query': (BuildContext context) => const MediaQueryPage(),
        '/responsive-widget/expanded': (BuildContext context) => const ExpandedPage(),
        '/responsive-widget/flexible': (BuildContext context) => const FlexiblePage(),
        '/responsive-widget/aspect-ratio': (BuildContext context) => const AspectRatioPage(),
        '/responsive-widget/orientation-builder': (BuildContext context) =>
            const OrientationBuilderPage(),
        '/responsive-widget/wrap': (BuildContext context) => const WrapPage(),
        '/responsive-widget/inherited': (BuildContext context) => const InheritedWidgetPage(),
      },
    );
  }
}
