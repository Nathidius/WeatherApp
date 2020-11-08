import 'package:flutter/material.dart';
import 'package:weather_app/resources/strings.dart';

import 'temperature_unit_switch.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        Strings.appTitle,
        style: TextStyle(color: Colors.black),
      ),
      actions: const [TemperatureUnitSwitch()],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
