import 'package:flutter/material.dart';
import 'package:notesapp/controllers/authController.dart';
import 'package:notesapp/screens/auth/login.dart';
import 'package:notesapp/screens/home/home.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authController.user?.uid != null) {
          return HomePage();
        } else {
          return Login();
        }
      },
    );
  }
}
