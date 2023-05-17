class Room {
  const Room({
    required this.users,
    required this.code,
    required this.lastInteraction,
    required this.owner,
  });

  Room.fromJson(Map<String, Object?> json)
      : this(
          users: convertUsersToListOfStrings(
            json['users']! as Iterable<String>,
          ),
          code: json['code']! as String,
          lastInteraction: json['lastInteraction']! as DateTime,
          owner: json['owner']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'users': users,
      'code': code,
      'lastInteraction': lastInteraction,
      'owner': owner,
    };
  }

  static List<String> convertUsersToListOfStrings(Iterable<String> users) {
    return List<String>.from(users.map((c) => c));
  }

  final List<String> users;
  final String code;
  final DateTime lastInteraction;
  final String owner;
}
