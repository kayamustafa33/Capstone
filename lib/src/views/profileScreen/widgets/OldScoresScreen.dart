import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/Score.dart';
import '../../../services/score_service.dart';

class OldScoresScreen extends StatefulWidget {
  const OldScoresScreen({super.key});
  static const String routeName = "/profileOldScores";

  @override
  State<OldScoresScreen> createState() => _OldScoresScreenState();
}

class _OldScoresScreenState extends State<OldScoresScreen> {
  final ScoreService _scoreService = ScoreService();
  late Future<List<Score>> _scoresFuture;
  int _userId = 0;
  bool _isLoadingUserId = true;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;
    setState(() {
      _userId = userId;
      _isLoadingUserId = false;
      _scoresFuture = _scoreService.fetchOldScores(_userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Eski Skorlar", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoadingUserId
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Score>>(
              future: _scoresFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Puan mevcut değil'));
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
