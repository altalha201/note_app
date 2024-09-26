import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'src/core/utils/bindings/store_bindings.dart';
import 'src/core/utils/route/app_router.dart';
import 'src/core/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const NotepadEX());
}

class NotepadEX extends StatelessWidget {
  const NotepadEX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: "Notepad.ex",
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      initialBinding: StoreBindings(),
      themeMode: AppTheme.kMode,
      theme: AppTheme.theme,
    );
  }
}
