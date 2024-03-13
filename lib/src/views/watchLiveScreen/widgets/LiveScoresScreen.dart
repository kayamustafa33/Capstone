import 'package:flutter/material.dart';

class LiveScoresScreen extends StatelessWidget {
  const LiveScoresScreen({super.key});
  static const String routeName = "/liveScoresScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Live Scores"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            color: Colors.black54,
            child: const SizedBox(
                width: double.infinity,
                height: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("User Score Data",style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}