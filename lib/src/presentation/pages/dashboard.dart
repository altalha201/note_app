import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/core/utils/route/route_name.dart';
import 'package:note_app/src/core/utils/theme/app_colors.dart';
import 'package:note_app/src/presentation/controllers/dashboard_controller.dart';
import 'package:note_app/src/presentation/widgets/user_details_header.dart';

import '../widgets/note_item.dart';

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
              child: Text("Add Note"),
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
