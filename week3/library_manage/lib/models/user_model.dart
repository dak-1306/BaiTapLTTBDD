class User {
  final String id;
  final String name;
  List<String> borrowedBookIds;

  User({required this.id, required this.name, List<String>? borrowedBookIds})
    : borrowedBookIds = borrowedBookIds ?? [];
}
