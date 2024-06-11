import 'package:flutter/material.dart';
import '../../../models/Club.dart';
import '../../../services/club_service.dart';

class LiveClubScreen extends StatefulWidget {
  const LiveClubScreen({super.key});
  static const String routeName = "/liveClubScreen";

  @override
  State<LiveClubScreen> createState() => _LiveClubScreenState();
}

class _LiveClubScreenState extends State<LiveClubScreen> {
  final ClubService _clubService = ClubService();
  late Future<List<Club>> _clubsFuture;
  bool _isLoading = true;

  @override
  void initState() {
    _loadClubs();
  }

  void _loadClubs() {
    setState(() {
      _isLoading = false;
      _clubsFuture = _clubService.fetchClubs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kulüpler", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<List<Club>>(
              future: _clubsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Hata: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Kulüp mevcut değil'));
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
