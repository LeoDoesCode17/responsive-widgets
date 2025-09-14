class AppRoutes {
  static const home = '/';
  static const responsiveWidget = '/responsive-widget';
  static const layoutBuilder = '/responsive-widget/layout-builder';
  static const mediaQuery = '/responsive-widget/media-query';
  static const expanded = '/responsive-widget/expanded';
  static const flexible = '/responsive-widget/flexible';
  static const aspectRatio = '/responsive-widget/aspect-ratio';
  static const orientationBuilder = '/responsive-widget/orientation-builder';
  static const wrap = '/responsive-widget/wrap';
  static const inheritedWidget = '/inherited-widget';
  static const statelessWidget = '/stateless-widget';
  static const statefulWidget = '/stateful-widget';
  static const counterCoin = '/stateful-widget/counter-coin';
  static List<String> responsiveWidgetRoutes() => [
    layoutBuilder,
    mediaQuery,
    expanded,
    flexible,
    aspectRatio,
    orientationBuilder,
    wrap,
  ];
  static List<String> responsiveWidgetLabels() => [
    'Layout Builder',
    'Media Query',
    'Expanded',
    'Flexible',
    'Aspect Ratio',
    'Orientation Builder',
    'Wrap'
  ];
  static List<String> statefulWidgetRoutes() => [counterCoin];
  static List<String> statefulLabels() => ['Counter Coin'];
}
