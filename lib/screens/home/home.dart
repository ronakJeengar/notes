import 'package:flutter/material.dart';
import 'package:notesapp/controllers/authController.dart';
import 'package:notesapp/controllers/noteController.dart';
import 'package:notesapp/screens/home/add_note.dart';
import 'package:notesapp/screens/home/note_list.dart';
import 'package:notesapp/screens/settings/setting.dart';
import 'package:notesapp/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class HomePage extends GetWidget<AuthController> {
  final AuthController authController = Get.find<AuthController>();

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Obx(() => Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconBtn(
                          color: Theme.of(context).colorScheme.background,
                          onPressed: () {
                            authController.axisCount.value =
                                authController.axisCount.value == 2 ? 4 : 2;
                          },
                          icon: Icon(authController.axisCount.value == 2
                              ? Icons.list
                              : Icons.grid_on),
                        ),
                        const Text(
                          "Notes",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomIconBtn(
                          color: Theme.of(context).colorScheme.background,
                          onPressed: () {
                            Get.to(() => Setting());
                          },
                          icon: const Icon(
                            Icons.settings,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetX<NoteController>(
                      init: Get.put<NoteController>(NoteController()),
                      builder: (NoteController noteController) {
                        return NoteList();
                      }),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Get.to(() => AddNotePage());
          },
          child: const Icon(
            Icons.note_add,
            size: 30,
          )),
    );
  }
}
