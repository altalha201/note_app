import '../../core/use_case/use_case.dart';
import '../repositories/note_db_repository.dart';

class DeleteNoteUseCase extends UseCase<void, String> {
  final NoteDbRepository _repository;

  DeleteNoteUseCase({required NoteDbRepository repository}) : _repository = repository;

  @override
  Future<void> execute(String params) {
    try {
      return _repository.deleteNote(params);
    } catch (e) {
      rethrow;
    }
  }
}