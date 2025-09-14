import 'package:flutter/material.dart';

class CounterCoinPage extends StatefulWidget {
  const CounterCoinPage({super.key});

  @override
  State<CounterCoinPage> createState() => _CounterCoinPageState();
}

class _CounterCoinPageState extends State<CounterCoinPage> {
  int _coins = 0;
  static const double _coinWidth = 160;
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
          scale: 0.1,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, Add or Remove Coins',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              _buildCoinList(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordValidatorPage extends StatefulWidget {
  const PasswordValidatorPage({super.key});

  @override
  State<PasswordValidatorPage> createState() => _PasswordValidatorPageState();
}

class _PasswordValidatorPageState extends State<PasswordValidatorPage> {
  String _password = '';
  bool get hasMinLength => _password.length >= 8;
  bool get hasNumber => _password.contains(RegExp(r'[0-9]'));
  bool get hasUppercase => _password.contains(RegExp(r'[A-Z]'));
  bool get hasSpecialChar =>
      _password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_-]'));

  Widget _buildRequirement(String text, bool met) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.cancel,
          color: met ? Colors.green : Colors.red,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Validator Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Password Validator Page',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Input Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 8),
            _buildRequirement("At least 8 characters", hasMinLength),
            SizedBox(height: 4),
            _buildRequirement("At least 1 number", hasNumber),
            SizedBox(height: 4),
            _buildRequirement("At least 1 uppercase letter", hasUppercase),
            SizedBox(height: 4),
            _buildRequirement("At least 1 special character", hasSpecialChar),
          ],
        ),
      ),
    );
  }
}
