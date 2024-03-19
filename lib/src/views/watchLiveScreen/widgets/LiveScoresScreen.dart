import 'package:flutter/material.dart';
import '../../homeScreen/widgets/BuildAgeGroup.dart';

class LiveScoresScreen extends StatelessWidget {
  const LiveScoresScreen({super.key});
  static const String routeName = "/liveScoresScreen";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Canlı Skorlar", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          elevation: 2.0,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Makaralı',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Olimpik',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCategories(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildCategories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return ExpansionTile(
      title: const Text('Cinsiyet Seçiniz'),
      children: [
        _buildGenderGroups("Erkek"),
        _buildGenderGroups("Kız"),
      ],
    );
  }

  Widget _buildGenderGroups(String gender) {
    return ExpansionTile(
      title: Text(gender),
      children: [
        buildAgeGroup(gender, "+15", [
          ['Player 1', '100'],
          ['Player 2', '85'],
          ['Player 3', '70']
        ]),
        buildAgeGroup(gender, "+13", [
          ['Player 4', '95'],
          ['Player 5', '80'],
          ['Player 6', '65']
        ]),
      ],
    );
  }
}
