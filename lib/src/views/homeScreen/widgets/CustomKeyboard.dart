import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;

  CustomKeyboard({required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _buildKeyRow(['M', '1', '2'])),
          Expanded(child: _buildKeyRow(['3', '4', '5'])),
          Expanded(child: _buildKeyRow(['6', '7', '8'])),
          Expanded(child: _buildKeyRow(['9', '10', 'X'])),
        ],
      ),
    );
  }

  Widget _buildKeyRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) => _buildKey(key)).toList(),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () {
        onKeyTap(value);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
