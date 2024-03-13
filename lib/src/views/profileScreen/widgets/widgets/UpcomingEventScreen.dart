import 'package:flutter/material.dart';

class UpcomingEventScreen extends StatelessWidget {
  const UpcomingEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Event Screen"),
      ),
      body: const Center(
        child: Text("Upcoming Event Screen"),
      ),
    );
  }
}
