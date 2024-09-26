import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/error/app_errors.dart';
import '../../domain/entities/note.dart';
import '../model/note_model.dart';

class NoteDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection("note_data");

  Future<void> insertNote(Note note) async {
    try {
      NoteModel model = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
        lastUpdatedAt: note.lastUpdatedAt,
        userId: note.userId,
      );
      await _reference.doc(model.id).set(model.toJson());
    } catch (e) {
      throw CloudStoreError("Note Collection Error -> $e");
    }
  }

  Future<List<Note>> getUserNotes(String userId) async {
    try {
      var docs = await _reference.where("user_id", isEqualTo: userId).get();
      List<Note> notes = docs.docs
          .map(
              (snap) => NoteModel.fromJson(snap.data() as Map<String, dynamic>))
          .toList();
      return notes;
    } catch (e) {
      throw CloudStoreError("Note Collection Error -> $e");
    }
  }

  Future<Note> getNote(String noteId) async {
    late Note note;
    await _reference.doc(noteId).get().then((doc) {
      if (doc.exists) {
        note = NoteModel.fromJson(doc.data() as Map<String, dynamic>);
      }
    }).onError((e, _) {
      throw CloudStoreError("Note Collection Error -> $e");
    });
    return note;
  }

  Future<void> deleteNote(String noteId) async {
    await _reference.doc(noteId).delete().onError((e, _) {
      throw CloudStoreError("Note Collection Error -> $e");
    });
  }

  Future<void> updateNote(Note note) async {
    NoteModel model = NoteModel(
      id: note.id,
      title: note.title,
      description: note.description,
      lastUpdatedAt: note.lastUpdatedAt,
      userId: note.userId,
    );
    _reference.doc(model.id).update({
      "note_title": model.title,
      "note_details": model.description,
      "updated_at": model.lastUpdatedAt.toString(),
    }).onError((e, _) {
      throw CloudStoreError("Note Collection Error -> $e");
    });
  }
}
