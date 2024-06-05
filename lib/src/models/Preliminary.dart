class Preliminary {
  int scoreId;
  int playerId;
  int competitionId;
  int totalScore;

  Preliminary({
    required this.scoreId,
    required this.playerId,
    required this.competitionId,
    required this.totalScore,
  });

  factory Preliminary.fromMap(Map<String, dynamic> map) {
    return Preliminary(
      scoreId: map['score_id'],
      playerId: map['player_id'],
      competitionId: map['competition_id'],
      totalScore: map['total_score'],
    );
  }
}
