import '../../domain/entities/note.dart';
import '../../domain/repositories/note_db_repository.dart';
import '../data_sources/note_data_source.dart';

class NoteDbRepositoryImpl implements NoteDbRepository {
  final NoteDataSource _dataSource;

  NoteDbRepositoryImpl({required NoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<void> deleteNote(String noteId) {
    try {
      return _dataSource.deleteNote(noteId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Note> getNote(String noteId) {
    try {
      return _dataSource.getNote(noteId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Note>> getUserNotes(String userId) {
    try {
      return _dataSource.getUserNotes(userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> insertNote(Note note) {
    try {
      return _dataSource.insertNote(note);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateNote(Note note) {
    try {
      return _dataSource.updateNote(note);
    } catch (e) {
      rethrow;
    }
  }
}
