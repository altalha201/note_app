import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../controllers/note_controller.dart';
import '../widgets/note_input_field.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({super.key, this.id, this.forEdit = false});

  final String? id;
  final bool forEdit;

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  late final TextEditingController _titleEt, _descriptionEt;

  @override
  void initState() {
    super.initState();
    _titleEt = TextEditingController();
    _descriptionEt = TextEditingController();
    if (widget.forEdit) {
      var note = Get.find<NoteController>().currentNote;
      _titleEt.text = note.title;
      _descriptionEt.text = note.description;
    }
  }

  @override
  void dispose() {
    _titleEt.dispose();
    _descriptionEt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGray,
      appBar: AppBar(
        backgroundColor: AppColors.darkGray,
        foregroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            if (widget.forEdit) {
              if (_titleEt.text.isEmpty && _descriptionEt.text.isEmpty) {
                Get.find<NoteController>().deleteNote(context, widget.id ?? "");
              } else {
                Get.find<NoteController>().updateNote(context, _titleEt.text,
                    _descriptionEt.text, widget.id ?? "");
              }
            } else {
              context.go(RouteName.kHome);
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: [
          Visibility(
            visible: widget.forEdit,
            replacement: IconButton(
              onPressed: () {
                Get.find<NoteController>().insertNewNote(context, _titleEt.text, _descriptionEt.text);
              },
              icon: const Icon(Icons.check_circle_outline),
            ),
            child: IconButton(
              onPressed: () {
                Get.find<NoteController>().deleteNote(context, widget.id ?? "");
              },
              icon: const Icon(
                Icons.delete_outline,
                color: AppColors.red,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            NoteInputField(
              controller: _titleEt,
              hint: "Title",
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: NoteInputField(
                controller: _descriptionEt,
                hint: "Write your note here.....",
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
