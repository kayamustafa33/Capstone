import 'package:capstone/src/views/homeScreen/widgets/BuildAgeGroup.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category, required this.gender, required this.liveScores});
  final String category;
  final String gender;
  final List<List<String>> liveScores;

  @override
  State<CategoryScreen> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.category,style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: buildAgeGroup(widget.category, widget.gender, widget.liveScores),
    );
  }
}