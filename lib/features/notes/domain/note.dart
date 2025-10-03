class Note {
  final int? id;
  final String title;
  final String content;
  final DateTime created;
  final DateTime updated;

  const Note({
    this.id,
    required this.title,
    required this.content,
    required this.created,
    required this.updated,
  });

  factory Note.fromMap(Map<String, dynamic> map, int? id) => Note(
    id: id,
    title: map['title'] as String,
    content: map['content'] as String,
    created: DateTime.fromMillisecondsSinceEpoch(map['created'] as int),
    updated: DateTime.fromMillisecondsSinceEpoch(map['updated'] as int),
  );

  Map<String, dynamic> toMap() => {
    'title': title,
    'content': content,
    'created': created.millisecondsSinceEpoch,
    'updated': updated.millisecondsSinceEpoch,
  };

  Note copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? created,
    DateTime? updated,
  }) => Note(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    created: created ?? this.created,
    updated: updated ?? this.updated,
  );
}
