import 'package:get/get.dart';

import 'session_controller_binding.dart';

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SessionControllerBinding.init);
  }
}
