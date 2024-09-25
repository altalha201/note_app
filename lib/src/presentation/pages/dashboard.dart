import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/presentation/controllers/auth_controller.dart';
import 'package:note_app/src/presentation/controllers/dashboard_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Get.find<DashboardController>().getDashboardData(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
