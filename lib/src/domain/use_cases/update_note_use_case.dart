import '../../core/use_case/use_case.dart';
import '../entities/note.dart';
import '../repositories/note_db_repository.dart';

class UpdateNoteUseCase implements UseCase<void, UpdateNoteParams> {
  final NoteDbRepository _repository;

  UpdateNoteUseCase({required NoteDbRepository repository})
      : _repository = repository;

  @override
  Future<void> execute(UpdateNoteParams params) {
    try {
      Note note = Note(
        id: params.id,
        title: params.title,
        description: params.description,
        lastUpdatedAt: DateTime.now(),
        userId: "",
      );
      return _repository.updateNote(note);
    } catch (e) {
      rethrow;
    }
  }
}

class UpdateNoteParams {
  final String id, title, description;

  UpdateNoteParams({
    required this.title,
    required this.description,
    required this.id,
  });
}
