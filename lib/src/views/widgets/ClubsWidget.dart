// src/views/widgets/clubs_widget.dart
import 'package:flutter/material.dart';
import '../../models/Club.dart';

Widget clubsWidget(BuildContext context, Club club) {
  return Card(
    child: Column(
      children: [
        Expanded(
          child: Image.network(
            club.logo ?? 'assets/logo.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(club.clubName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(club.city),
              Text(club.contactInfo),
              Text(club.representative),
            ],
          ),
        ),
      ],
    ),
  );
}
