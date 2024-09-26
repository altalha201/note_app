import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/entities/note.dart';
import '../../domain/use_cases/delete_note_use_case.dart';
import '../../domain/use_cases/insert_note_use_case.dart';
import '../../domain/use_cases/update_note_use_case.dart';
import 'session_controller.dart';

class NoteController extends GetxController {
  final InsertNoteUseCase _insertNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  Note _currentNote = Note(
      id: "",
      title: "",
      description: "",
      lastUpdatedAt: DateTime.now(),
      userId: "");

  NoteController(
      {required InsertNoteUseCase insertNoteUseCase,
      required UpdateNoteUseCase updateNoteUseCase,
      required DeleteNoteUseCase deleteNoteUseCase})
      : _insertNoteUseCase = insertNoteUseCase,
        _updateNoteUseCase = updateNoteUseCase,
        _deleteNoteUseCase = deleteNoteUseCase;

  Note get currentNote => _currentNote;

  void setCurrentNote(Note note) {
    _currentNote = note;
    update();
  }

  Future<void> insertNewNote(
      BuildContext context, String title, String description) async {
    String userId = Get.find<SessionController>().currentUserId;
    await _insertNoteUseCase
        .execute(
      InsertNoteParams(
        userId: userId,
        title: title,
        description: description,
      ),
    )
        .then((_) {
      context.go(RouteName.kHome);
    }).onError((error, _) {
      _onError(context, error);
    });
  }

  Future<void> updateNote(
      BuildContext context, String title, String description, String id) async {
    await _updateNoteUseCase
        .execute(
            UpdateNoteParams(title: title, description: description, id: id))
        .then((_) {
      context.go(RouteName.kHome);
    }).onError((error, _) {
      _onError(context, error);
    });
  }

  Future<void> deleteNote(BuildContext context, String id) async {
    await _deleteNoteUseCase.execute(id).then((_) {
      context.go(RouteName.kHome);
    }).onError((err, _) {
      _onError(context, err);
    });
  }

  void _onError(BuildContext context, Object? error) {
    debugPrint(error.toString());
    UiUtils.showSnackBarMess(context, error.toString());
  }
}
