import '../entities/note.dart';

abstract class NoteDbRepository {
  Future<void> insertNote(Note note);

  Future<List<Note>> getUserNotes(String userId);

  Future<Note> getNote(String noteId);

  Future<void> deleteNote(String noteId);

  Future<void> updateNote(Note note);
}