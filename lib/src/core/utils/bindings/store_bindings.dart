import 'package:get/get.dart';
import 'package:note_app/src/core/utils/bindings/dashboard_controller_binding.dart';

import 'auth_controller_binding.dart';
import 'session_controller_binding.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionControllerBinding.init);
    Get.put(AuthControllerBinding.init);
    Get.put(DashboardControllerBinding.init);
  }
}
