import 'package:flutter/material.dart';

class CounterCoinPage extends StatefulWidget {
  const CounterCoinPage({super.key});

  @override
  State<CounterCoinPage> createState() => _CounterCoinPageState();
}

class _CounterCoinPageState extends State<CounterCoinPage> {
  int _coins = 0;
  static const double _coinWidth = 120;
  static const double _coinHeight = 160;

  void _incrementCoin() => setState(() => _coins++);
  void _decrementCoin() => setState(() => _coins--);

  Widget _buildCoinList() {
    if (_coins == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Text(
          'No coins yet. Tap + to add!',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.grey),
        ),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: List.generate(
        _coins,
        (index) => Image.asset(
          "assets/images/dollar_png.png",
          fit: BoxFit.cover,
          width: _coinWidth,
          height: _coinHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Counter Coin Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome, Add or Remove Coins',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Expanded(child: SingleChildScrollView(child: _buildCoinList())),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _incrementCoin,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  SizedBox(width: 24),
                  FloatingActionButton(
                    onPressed: _coins > 0 ? _decrementCoin : null,
                    tooltip: 'Decrement',
                    backgroundColor: _coins > 0
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
