import 'package:flutter/material.dart';

class CurrentEventScreen extends StatelessWidget {
  const CurrentEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Event Screen"),
      ),
      body: const Center(
        child: Text("Current Event Screen"),
      ),
    );
  }
}
