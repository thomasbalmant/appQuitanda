import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined), label: 'Home')
      ]),
    );
  }
}
