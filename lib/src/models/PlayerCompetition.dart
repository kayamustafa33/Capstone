class PlayerCompetition {
  int playerCompId;
  int set;
  int playerId;
  int competitionId;
  int arrowCount;
  int score;

  PlayerCompetition(
      {required this.playerCompId,
      required this.set,
      required this.playerId,
      required this.competitionId,
      required this.arrowCount,
      required this.score});

  @override
  String toString() {
    return 'PlayerCompetition(playerCompId: $playerCompId, set: $set, playerId: $playerId, competitionId: $competitionId, arrowCount: $arrowCount, score: $score)';
  }
}
