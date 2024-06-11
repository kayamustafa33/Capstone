import 'package:flutter/material.dart';
import 'package:okculuk_federasyonu/src/views/homeScreen/widgets/CustomBottomSheet.dart';
import 'package:okculuk_federasyonu/src/views/homeScreen/widgets/ScoreTable.dart';
import '../../models/PlayerCompetition.dart';
import '../../models/User.dart';
import '../../services/competition_service.dart';
import '../../services/player_compitition_service.dart';
import '../../services/player_service.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  static const String routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PlayerCompetitionService _playerCompetitionService;
  late PlayerService _playerService;
  late CompetitionService _competitionService;
  late List<List<int>> _scores;
  late int _currentSet;
  late int _currentArrow;
  bool _hasCompetition = false;
  bool _isLoading = true;
  String? _errorMessage;
  int? _currentCompetitionId;

  @override
  void initState() {
    super.initState();
    _playerCompetitionService = PlayerCompetitionService();
    _playerService = PlayerService();
    _competitionService = CompetitionService();
    _scores = List.generate(12, (_) => List.filled(6, -1));
    _currentSet = 0;
    _currentArrow = 0;
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      int? playerId = await _playerService.fetchPlayerId(widget.user.userId);
      if (playerId != null) {
        int? competitionId =
            await _competitionService.fetchActiveCompetitionId();
        if (competitionId != null) {
          setState(() {
            _currentCompetitionId = competitionId;
          });
          await _fetchScores(playerId, competitionId);
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Bir hata oluştu: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchScores(int playerId, int competitionId) async {
    try {
      List<PlayerCompetition> scores =
          await _playerCompetitionService.fetchScores(playerId, competitionId);
      setState(() {
        if (scores.isNotEmpty) {
          _hasCompetition = true;
          for (var score in scores) {
            if (score.set - 1 >= 0 &&
                score.set - 1 < _scores.length &&
                score.arrowCount - 1 >= 0 &&
                score.arrowCount - 1 < _scores[score.set - 1].length) {
              _scores[score.set - 1][score.arrowCount - 1] = score.score;
            }
          }
          for (int i = 0; i < _scores.length; i++) {
            for (int j = 0; j < _scores[i].length; j++) {
              if (_scores[i][j] == -1) {
                _currentSet = i;
                _currentArrow = j;
                return;
              }
            }
          }
        } else {
          _hasCompetition = false;
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Bir hata oluştu: $e";
      });
    }
  }

  void _updateScore(int set, int arrow, int score) {
    setState(() {
      _scores[set][arrow] = score;
      if (arrow < 5) {
        _currentArrow++;
      } else {
        _currentArrow = 0;
        _currentSet++;
      }
    });
  }

  void _showBottomSheet(BuildContext context, int set, int arrow) {
    final TextEditingController scoreController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) {
        return AddScoreBottomSheet(
          scoreController: scoreController,
          onSubmit: () {
            final score = int.tryParse(scoreController.text);
            if (score != null && score >= 0 && score <= 10) {
              final playerCompetition = PlayerCompetition(
                playerCompId: 0,
                set: set + 1,
                playerId: widget.user.userId,
                competitionId: _currentCompetitionId!,
                arrowCount: arrow + 1,
                score: score,
              );
              _playerCompetitionService.postScore(playerCompetition);
              _updateScore(set, arrow, score);
              Navigator.pop(ctx);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Lütfen 0 ile 10 arasında geçerli bir puan girin.')),
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String archerName = widget.user.name.split(' ')[0];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Hoş geldin $archerName",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 2.0,
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/target.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _errorMessage != null
              ? Center(
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: _hasCompetition
                      ? SingleChildScrollView(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ScoreTable(
                              allScores: _scores,
                              isDetector: true,
                              onCellTap: (set, arrow) {
                                if (set == _currentSet &&
                                    arrow == _currentArrow) {
                                  _showBottomSheet(context, set, arrow);
                                }
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ))
                      : Center(
                          child: Text(
                            "Henüz aktif bir yarışma yok",
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ),
                ),
    );
  }
}
