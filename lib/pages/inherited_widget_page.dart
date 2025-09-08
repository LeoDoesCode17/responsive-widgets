import 'package:flutter/material.dart';

class ThemeInheritedWidget extends InheritedWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const ThemeInheritedWidget({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
    required super.child,
  });

  // helper to access child easily
  static ThemeInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>()!;
  }

  // rebuild if the theme changes (isDarkMode changes)
  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) =>
      isDarkMode != oldWidget.isDarkMode;
}

class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({super.key});
  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  bool _isDarkMode = false;
  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      isDarkMode: _isDarkMode,
      toggleTheme: _toggleTheme,
      child: SwitchThemePage(),
    );
  }
}

class SwitchThemePage extends StatelessWidget {
  const SwitchThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          theme.isDarkMode ? 'Dark Mode Page' : 'Light Mode Page',
          style: TextStyle(fontSize: 20, color: theme.isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: theme.isDarkMode ? Colors.grey[850] : Colors.blue[600],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => theme.toggleTheme(),
          child: Text(
            theme.isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode",
          ),
        ),
      ),
    );
  }
}
