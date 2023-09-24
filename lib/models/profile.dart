class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.number,
    required this.createdAt,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// number of the profile
  final String number;

  /// Date and time when the profile was created
  final DateTime createdAt;

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        number = map['number'],
        createdAt = DateTime.parse(map['created_at']);
}
