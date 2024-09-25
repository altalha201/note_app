import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/src/core/utils/theme/app_colors.dart';
import 'package:note_app/src/core/utils/ui_utils/ui_utils.dart';
import 'package:note_app/src/presentation/controllers/dashboard_controller.dart';

class UserDetailsHeader extends StatelessWidget implements PreferredSizeWidget {
  const UserDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GetBuilder<DashboardController>(builder: (controller) {
        return ListTile(
          leading: Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              image: DecorationImage(
                image: AssetImage(
                  controller.current.gender.getImage(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            controller.current.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          subtitle: Text(
            controller.current.email,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
            onPressed: () {
              UiUtils.showYesNoDialog(
                  context,
                  "Want to Logout?",
                  "No",
                  () {
                    Get.back();
                  },
                  "Yes",
                  () {
                    controller.logoutUser(context);
                  });
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.red,
            ),
          ),
        );
      }),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 80);
}
