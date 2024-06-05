class Competition {
  int competitionId;
  String competitionName;
  String competitionStyle;
  DateTime competitionDate;
  String location;
  DateTime startTime;
  DateTime endTime;

  Competition({
    required this.competitionId,
    required this.competitionName,
    required this.competitionStyle,
    required this.competitionDate,
    required this.location,
    required this.startTime,
    required this.endTime,
  });

  factory Competition.fromMap(Map<dynamic, dynamic> map) {
    return Competition(
      competitionId: map['competition_id'],
      competitionName: map['competition_name'],
      competitionStyle: map['competition_style'],
      competitionDate: map['competition_date'],
      location: map['location'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }
}
