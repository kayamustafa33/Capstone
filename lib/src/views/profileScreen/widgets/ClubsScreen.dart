import 'package:flutter/material.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});
  static const String routeName = "/profileClubs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubs"),
      ),
      body: const Center(
        child: Text("Clubs"),
      ),
    );
  }
}
