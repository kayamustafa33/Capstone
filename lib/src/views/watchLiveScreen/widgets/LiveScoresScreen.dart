import 'package:flutter/material.dart';
import '../../homeScreen/widgets/BuildAgeGroup.dart';

class LiveScoresScreen extends StatefulWidget {
  const LiveScoresScreen({super.key});

  static const String routeName = "/liveScoresScreen";

  @override
  State<LiveScoresScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoresScreen> {
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
        body: _buildTabViewGender(),
      ),
    );
  }

  Widget _buildTabViewGender() {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            children: [
              _buildGenderGroups("Makaralı"),
              _buildGenderGroups("Olimpik"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGenderGroups(String category) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Erkek',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Kız',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAgeGroups(category, "Erkek"),
                  _buildAgeGroups(category, "Kız"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgeGroups(String category, String gender) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
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
          ),

        ],
      ),
    );
  }
}
