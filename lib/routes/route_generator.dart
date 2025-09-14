import 'package:flutter/material.dart';
import 'package:responsive_widgets/pages/entrypoint_pages.dart';
import 'package:responsive_widgets/pages/home_page.dart';
import 'package:responsive_widgets/pages/responsive_widget_pages.dart';
import 'package:responsive_widgets/pages/stateful_widget_pages.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.responsiveWidget:
        return MaterialPageRoute(builder: (_) => const ResponsiveEntryPoint());
      case AppRoutes.mediaQuery:
        return MaterialPageRoute(builder: (_) => const MediaQueryPage());
      case AppRoutes.expanded:
        return MaterialPageRoute(builder: (_) => const ExpandedPage());
      case AppRoutes.flexible:
        return MaterialPageRoute(builder: (_) => const FlexiblePage());
      case AppRoutes.aspectRatio:
        return MaterialPageRoute(builder: (_) => const AspectRatioPage());
      case AppRoutes.orientationBuilder:
        return MaterialPageRoute(
          builder: (_) => const OrientationBuilderPage(),
        );
      case AppRoutes.wrap:
        return MaterialPageRoute(builder: (_) => const WrapPage());
      case AppRoutes.inheritedWidget:
        return MaterialPageRoute(builder: (_) => const InheritedEntryPoint());
      case AppRoutes.statelessWidget:
        return MaterialPageRoute(builder: (_) => const StatelessEntryPoint());
      case AppRoutes.statefulWidget:
        return MaterialPageRoute(builder: (_) => const StatefulEntryPoint());
      case AppRoutes.counterCoin:
        return MaterialPageRoute(builder: (_) => const CounterCoinPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text("Route not found"))),
    );
  }
}
