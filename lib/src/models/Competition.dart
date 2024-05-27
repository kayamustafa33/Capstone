class Competition {
  int competitionId;
  String competitionName;
  String competitionStyle;
  DateTime competitionDate;
  String location;
  DateTime startTime;
  DateTime endTime;
  Competition(
      {required this.competitionId,
      required this.competitionName,
      required this.competitionStyle,
      required this.competitionDate,
      required this.location,
      required this.endTime,
      required this.startTime});
}
