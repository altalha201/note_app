import 'package:uuid/uuid.dart';

import '../../core/use_case/use_case.dart';
import '../entities/note.dart';
import '../repositories/note_db_repository.dart';

class InsertNoteUseCase implements UseCase<void, InsertNoteParams> {
  final NoteDbRepository _repository;

  InsertNoteUseCase({required NoteDbRepository repository})
      : _repository = repository;

  @override
  Future<void> execute(InsertNoteParams params) {
    try {
      var uuid = const Uuid();
      Note note = Note(
        id: uuid.v1(),
        title: params.title,
        description: params.description,
        lastUpdatedAt: DateTime.now(),
        userId: params.userId,
      );
      return _repository.insertNote(note);
    } catch (e) {
      rethrow;
    }
  }
}

class InsertNoteParams {
  final String userId, title, description;

  InsertNoteParams({
    required this.userId,
    required this.title,
    required this.description,
  });
}
