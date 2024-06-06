class Club {
  int clubId;
  String clubName;
  String city;
  String contactInfo;
  String representative;
  String? logo;

  Club({
    required this.clubId,
    required this.clubName,
    required this.city,
    required this.contactInfo,
    required this.representative,
    this.logo,
  });

  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      clubId: map['club_id'],
      clubName: map['club_name'],
      city: map['city'],
      contactInfo: map['contact_info'],
      representative: map['representative'],
      logo: map['logo'],
    );
  }
}
