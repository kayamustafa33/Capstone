import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/score_service.dart';
import '../../services/competition_service.dart';
import '../../models/Score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  static const String routeName = "/scoresScreen";

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  final ScoreService _scoreService = ScoreService();
  final CompetitionService _competitionService = CompetitionService();
  late Future<List<Score>> _scoresFuture;
  int _userId = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scoresFuture = Future.value([]);
    _initializeData();
  }

  Future<void> _initializeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;

    int? competitionId = await _competitionService.fetchActiveCompetitionId();

    if (competitionId != null) {
      setState(() {
        _userId = userId;
        _scoresFuture = _scoreService.fetchScores(competitionId, _userId);
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _scoresFuture = Future.value([]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Skorlar", style: TextStyle(color: Colors.white)),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Score>>(
              future: _scoresFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Puan yok'));
                } else {
                  final scores = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: scores.length,
                    itemBuilder: (context, index) {
                      final score = scores[index];
                      return Card(
                        child: ListTile(
                          title: Text(score.playerName),
                          trailing: Text(score.totalScore.toString()),
                        ),
                      );
                    },
                  );
                }
              },
            ),
    );
  }
}
