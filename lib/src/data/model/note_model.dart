import '../../domain/entities/note.dart';

class NoteModel extends Note {
  NoteModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["note_id"] ?? "",
        title: json["note_title"] ?? "",
        description: json["note_details"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "note_id": id,
        "note_title": title,
        "note_details": description,
      };
}
