import 'package:capstone/src/views/homeScreen/widgets/CustomBottomSheet.dart';
import 'package:capstone/src/views/homeScreen/widgets/ScoreTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome Archer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Expanded(child: ScoreTable()), AddScoreBottomSheet()],
      ),
    );
  }
}
