import 'package:flutter/material.dart';
import 'package:notesapp/screens/settings/widgets/list_tile.dart';
import 'package:notesapp/screens/widgets/custom_icon_btn.dart';
import 'package:get/get.dart';

class DarkMode extends StatelessWidget {
  const DarkMode({super.key});

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
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  const Text(
                    "Appearnace",
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
                    Get.changeThemeMode(ThemeMode.system);
                  },
                  title: "Use device setting",
                  iconData: Icons.settings_brightness_outlined,
                  subtitle: const Text(
                    "Auttomatically swtich between Light and Dark themes when your system does",
                  )),
              ListTileSetting(
                onTap: () {
                  Get.changeThemeMode(ThemeMode.light);
                },
                title: "Light Mode",
                iconData: Icons.brightness_5,
                subtitle: const Text("empty"),
              ),
              ListTileSetting(
                iconData: Icons.brightness_4_outlined,
                onTap: () {
                  Get.changeThemeMode(ThemeMode.dark);
                },
                title: "Dark Mode",
                subtitle: const Text("empty"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
