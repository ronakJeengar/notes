import 'package:flutter/material.dart';
import 'package:notesapp/controllers/authController.dart';
import 'package:notesapp/screens/settings/account.dart';
import 'package:notesapp/screens/settings/dark_mode.dart';
import 'package:notesapp/screens/settings/widgets/list_tile.dart';
import 'package:notesapp/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconBtn(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    color: Theme.of(context).colorScheme.background,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ListTileSetting(
                onTap: () {
                  Get.to(() => Account());
                },
                title: "Account",
                iconData: Icons.person,
                subtitle: const Text("empty"),
              ),
              ListTileSetting(
                onTap: () {
                  Get.to(() => const DarkMode());
                },
                title: "Dark Mode",
                iconData: Icons.nights_stay,
                subtitle: const Text("empty"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
