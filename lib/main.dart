import 'package:flutter/material.dart';
import 'package:responsive_widgets/routes/route_generator.dart';
import 'package:responsive_widgets/routes/routes.dart';

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
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
