class Note {
  final String id;
  final String title;
  final String description;
  final String userId;
  final DateTime lastUpdatedAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.lastUpdatedAt,
    required this.userId,
  });
}
