import 'package:flutter/material.dart';

import '../../profileScreen/widgets/widgets.dart';

class LiveClubScreen extends StatelessWidget {
  const LiveClubScreen({super.key});
  static const String routeName = "/liveClubScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kulüpler",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: 8,
          itemBuilder: (context,index) {
            return clubsWidget(context);
          }
      ),
    );
  }
}