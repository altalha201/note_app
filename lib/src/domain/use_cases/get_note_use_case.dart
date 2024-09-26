import '../../core/use_case/use_case.dart';
import '../entities/note.dart';
import '../repositories/note_db_repository.dart';

class GetNoteUseCase extends UseCase<Note, String> {
  final NoteDbRepository _repository;

  GetNoteUseCase({required NoteDbRepository repository})
      : _repository = repository;

  @override
  Future<Note> execute(String params) {
    try {
      return _repository.getNote(params);
    } catch (e) {
      rethrow;
    }
  }
}