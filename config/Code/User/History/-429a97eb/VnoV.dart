// FirstPage.dart
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: const Center(
        child: Text(
          'This is the first page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}