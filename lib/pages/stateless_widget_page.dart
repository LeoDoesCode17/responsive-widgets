import 'package:flutter/material.dart';
import 'package:responsive_widgets/pages/profile_page.dart';

class StatelessWidgetPage extends StatelessWidget {
  const StatelessWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ProfilePage(),
    );
  }
}
