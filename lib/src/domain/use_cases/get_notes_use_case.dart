import '../../core/use_case/use_case.dart';
import '../entities/note.dart';
import '../repositories/note_db_repository.dart';

class GetNotesUseCase implements UseCase<List<Note>, String> {
  final NoteDbRepository _repository;

  GetNotesUseCase({required NoteDbRepository repository})
      : _repository = repository;

  @override
  Future<List<Note>> execute(String params) {
    try {
      return _repository.getUserNotes(params);
    } catch (e) {
      rethrow;
    }
  }
}
