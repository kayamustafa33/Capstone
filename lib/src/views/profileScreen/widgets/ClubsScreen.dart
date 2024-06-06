import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/Club.dart';
import '../../../services/club_service.dart';
import '../../../services/player_service.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});
  static const String routeName = "/profileClubs";

  @override
  _ClubsScreenState createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  final ClubService _clubService = ClubService();
  final PlayerService _playerService = PlayerService();
  late Future<List<Club>> _clubsFuture;
  int _userId = 0;
  int _playerId = 0;
  bool _isLoadingPlayerId = true;

  @override
  void initState() {
    super.initState();
    _loadUserIdAndFetchPlayerId();
  }

  Future<void> _loadUserIdAndFetchPlayerId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId') ?? 0;
    setState(() {
      _userId = userId;
    });

    int? playerId = await _playerService.fetchPlayerId(_userId);
    setState(() {
      _playerId = playerId ?? 0;
      _isLoadingPlayerId = false;
      _clubsFuture = _clubService.fetchClubsForPlayer(_playerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kulüpler", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoadingPlayerId
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Club>>(
              future: _clubsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No clubs available'));
                } else {
                  final clubs = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: clubs.length,
                    itemBuilder: (context, index) {
                      final club = clubs[index];
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: Image.network(
                            club.logo ?? 'assets/logo.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/logo.jpg',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                          title: Text(club.clubName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(club.city),
                              Text(club.contactInfo),
                              Text(club.representative),
                            ],
                          ),
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
