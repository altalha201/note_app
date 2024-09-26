import '../../../data/data_sources/note_data_source.dart';
import '../../../data/data_sources/user_db_data_source.dart';
import '../../../data/data_sources/user_preference_data_source.dart';
import '../../../data/repositories/note_db_repository_impl.dart';
import '../../../data/repositories/user_db_data_repository_impl.dart';
import '../../../data/repositories/user_pref_repository_impl.dart';
import '../../../domain/use_cases/check_login_use_case.dart';
import '../../../domain/use_cases/get_notes_use_case.dart';
import '../../../domain/use_cases/get_user_from_pref_use_case.dart';
import '../../../domain/use_cases/get_user_use_case.dart';
import '../../../domain/use_cases/remove_user_from_pref_use_case.dart';
import '../../../domain/use_cases/save_user_to_pref_use_case.dart';
import '../../../presentation/controllers/dashboard_controller.dart';

class DashboardControllerBinding {
  static final DashboardController init = DashboardController(
    checkLoginUseCase: _checkLoginUseCase,
    getUserFromPrefUseCase: _getUserFromPrefUseCase,
    getUserUseCase: _getUserUseCase,
    saveUserToPrefUseCase: _saveUserToPrefUseCase,
    removeUserFromPrefUseCase: _removeUserFromPrefUseCase,
    getNotesUseCase: _getNotesUseCase,
  );

  static final UserPreferenceDataSource _userPreferenceDataSource = UserPreferenceDataSource();
  static final UserDbDataSource _userDbDataSource = UserDbDataSource();
  static final NoteDataSource _noteDataSource = NoteDataSource();


  static final UserPrefRepositoryImpl _userPrefRepository = UserPrefRepositoryImpl(_userPreferenceDataSource);
  static final UserDbDataRepositoryImpl _userDbDataRepositoryImpl = UserDbDataRepositoryImpl(userDbDataSource: _userDbDataSource);
  static final NoteDbRepositoryImpl _noteDbRepositoryImpl = NoteDbRepositoryImpl(dataSource: _noteDataSource);


  static final CheckLoginUseCase _checkLoginUseCase = CheckLoginUseCase(_userPrefRepository);
  static final GetUserFromPrefUseCase _getUserFromPrefUseCase = GetUserFromPrefUseCase(_userPrefRepository);
  static final GetUserUseCase _getUserUseCase = GetUserUseCase(repository: _userDbDataRepositoryImpl);
  static final SaveUserToPrefUseCase _saveUserToPrefUseCase = SaveUserToPrefUseCase(_userPrefRepository);
  static final RemoveUserFromPrefUseCase _removeUserFromPrefUseCase = RemoveUserFromPrefUseCase(_userPrefRepository);
  static final GetNotesUseCase _getNotesUseCase = GetNotesUseCase(repository: _noteDbRepositoryImpl);
}
