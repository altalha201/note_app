import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../domain/entities/note.dart';
import '../controllers/note_controller.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () {
          Get.find<NoteController>().setCurrentNote(note);
          context.go(RouteName.kDetails, extra: {"id" : note.id, "for_edit": true});
        },
        child: Card(
          color: AppColors.whiteOpacity1,
          child: ListTile(
            textColor: AppColors.white,
            title: note.title.isNotEmpty
                ? Text(note.title, maxLines: 1, overflow: TextOverflow.ellipsis)
                : const SizedBox.shrink(),
            subtitle: note.description.isNotEmpty
                ? Text(
                    note.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
