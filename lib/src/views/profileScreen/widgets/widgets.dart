import 'package:flutter/material.dart';

export 'ActivitiesScreen.dart';
export 'ClubsScreen.dart';
export 'OldScoresScreen.dart';


Widget oldScoresWidget(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Old Scores"),
        ],
      ),
    ),
  );
}

Widget clubsWidget(BuildContext context){
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Clubs"),
        ],
      ),
    ),
  );
}