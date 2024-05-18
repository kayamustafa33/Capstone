import 'package:flutter/material.dart';

class UpcomingEventScreen extends StatelessWidget {
  const UpcomingEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Event Screen",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
        child: Text("Upcoming Event Screen"),
      ),
    );
  }
}
