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
        title: Text('Active Competitions'),
      ),
      body: FutureBuilder<List<Competition>>(
        future: _competitions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No active competitions'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final competition = snapshot.data![index];
                return ListTile(
                  title: Text(competition.competitionName),
                  subtitle: Text(
                      '${competition.competitionDate} at ${competition.location}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompetitionDetailScreen(competition: competition),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
