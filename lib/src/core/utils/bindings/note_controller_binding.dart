import '../../../data/data_sources/note_data_source.dart';
import '../../../data/repositories/note_db_repository_impl.dart';
import '../../../domain/use_cases/delete_note_use_case.dart';
import '../../../domain/use_cases/insert_note_use_case.dart';
import '../../../domain/use_cases/update_note_use_case.dart';
import '../../../presentation/controllers/note_controller.dart';

class NoteControllerBinding {
  static final NoteController init = NoteController(
    insertNoteUseCase: _insertNoteUseCase,
    updateNoteUseCase: _updateNoteUseCase,
    deleteNoteUseCase: _deleteNoteUseCase,
  );

  static final NoteDataSource _noteDataSource = NoteDataSource();

  static final NoteDbRepositoryImpl _noteDbRepository = NoteDbRepositoryImpl(dataSource: _noteDataSource);

  static final InsertNoteUseCase _insertNoteUseCase = InsertNoteUseCase(repository: _noteDbRepository);
  static final UpdateNoteUseCase _updateNoteUseCase = UpdateNoteUseCase(repository: _noteDbRepository);
  static final DeleteNoteUseCase _deleteNoteUseCase = DeleteNoteUseCase(repository: _noteDbRepository);
}
