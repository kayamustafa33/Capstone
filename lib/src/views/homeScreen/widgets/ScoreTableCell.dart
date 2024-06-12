import 'package:flutter/material.dart';

class ScoreTableCell extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool? isDetector;

  const ScoreTableCell({
    super.key,
    required this.text,
    this.onTap,
    required this.isDetector,
  });

  @override
  Widget build(BuildContext context) {
    if (isDetector == true) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              text,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }
}
