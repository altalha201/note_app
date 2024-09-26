import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/note_item.dart';
import '../widgets/user_details_header.dart';

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
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: const UserDetailsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GetBuilder<DashboardController>(builder: (controller) {
          if (controller.notes.isEmpty) {
            return const Center(
              child: Text(
                "Add Note",
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notes.length,
            itemBuilder: (context, index) => NoteItem(
              note: controller.notes.elementAt(index),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkBlue,
        onPressed: () {
          context.go(RouteName.kDetails);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
