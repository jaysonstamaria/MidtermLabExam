import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;

  const Counter({super.key,
  required this.counter,
  required this.onIncrement});

  get elements => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // To center yung row elements
      children: <Widget> [
        ElevatedButton(
          onPressed: onIncrement,  // Ito yung callback function kapag na-click
          child: const Text('Increment'),  // Text button
        ),
        const SizedBox(width: 16), // Display ng count value
        Text('Count: $counter'),
      ],
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;  // Dito na mag-store ng state

  void _incrementCounter() {
    setState(() {
          _counter++;  // Update ng counter pag na-click
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Counter(
          counter: _counter,  // I-pass yung current counter value sa stateless widget
          onIncrement: _incrementCounter,   // Callback function to update the counter
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: CounterApp(),  // Dito natin i-run yung app
    ),
  );
}