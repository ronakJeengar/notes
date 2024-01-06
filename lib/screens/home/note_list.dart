import 'dart:math';
import 'package:flutter/material.dart';
import 'package:notesapp/controllers/authController.dart';
import 'package:notesapp/controllers/noteController.dart';
import 'package:notesapp/screens/home/show_note.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class NoteList extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final NoteController noteController = Get.find<NoteController>();
  final lightColors = [
    Colors.amber.shade300,
    Colors.lightGreen.shade300,
    Colors.lightBlue.shade300,
    Colors.orange.shade300,
    Colors.pinkAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.purpleAccent,
    Colors.greenAccent.shade400,
    Colors.cyanAccent,
  ];

  NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        itemCount: noteController.notes.length,
        staggeredTileBuilder: (index) =>
            StaggeredTile.fit(authController.axisCount.value),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          var formattedDate = DateFormat.yMMMd()
              .format(noteController.notes[index].creationDate.toDate());
          Random random = Random();
          Color bg = lightColors[random.nextInt(8)];
          return GestureDetector(
            onTap: () {
              Get.to(() => ShowNote(
                  index: index, noteData: noteController.notes[index]));
            },
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: bg,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      right: 8,
                      left: 8,
                      bottom: 0,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Text(
                        noteController.notes[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      noteController.notes[index].body,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
