import 'package:flutter/material.dart';
import '../../models/Club.dart';

Widget clubsWidget(BuildContext context, Club club) {
  return Card(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
            club.logo), // Make sure to handle image URLs appropriately
        Text(club.clubName),
        Text(club.city),
      ],
    ),
  );
}
