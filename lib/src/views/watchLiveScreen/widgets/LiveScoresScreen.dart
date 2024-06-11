import 'package:flutter/material.dart';
import '../../../models/Competition.dart';
import '../../../services/competition_service.dart';
import 'CompetitionDetailScreen.dart';

class LiveScoresScreen extends StatefulWidget {
  const LiveScoresScreen({super.key});

  static const String routeName = "/liveScoresScreen";

  @override
  State<LiveScoresScreen> createState() => _LiveScoresScreenState();
}

class _LiveScoresScreenState extends State<LiveScoresScreen> {
  late Future<List<Competition>> _competitions;

  @override
  void initState() {
    super.initState();
    _competitions = CompetitionService().fetchActiveCompetitions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aktif Yarışmalar',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Competition>>(
        future: _competitions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aktif yarışma yok'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final competition = snapshot.data![index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      competition.competitionName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${competition.competitionDate.toIso8601String().split('T').first} at ${competition.location}',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    trailing:
                        Icon(Icons.arrow_forward, color: Colors.blueAccent),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CompetitionDetailScreen(competition: competition),
                        ),
                      );
                    },
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
