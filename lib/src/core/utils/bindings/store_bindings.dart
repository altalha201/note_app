import 'package:get/get.dart';
import 'package:note_app/src/core/utils/bindings/note_controller_binding.dart';

import 'dashboard_controller_binding.dart';
import 'login_controller_binding.dart';
import 'signup_controller_binding.dart';
import 'session_controller_binding.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionControllerBinding.init);
    Get.put(SignupControllerBinding.init);
    Get.put(DashboardControllerBinding.init);
    Get.put(LoginControllerBinding.init);
    Get.put(NoteControllerBinding.init);
  }
}
