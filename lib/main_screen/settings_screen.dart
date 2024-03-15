import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool isDark = false;

  void getThemeMode() async {
    final saveThemeMode = await AdaptiveTheme.getThemeMode();
    if (saveThemeMode == AdaptiveThemeMode.dark) {
      setState(() {
        isDark = true;
      });
    }
  }
  @override
  initState() {
    super.initState();
    getThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: SwitchListTile(
              secondary: isDark? const Icon(Icons.dark_mode):const Icon(Icons.light_mode),
              value: isDark,
              onChanged: (value) {
                isDark = value;
                isDark
                    ? AdaptiveTheme.of(context).setDark()
                    : AdaptiveTheme.of(context).setLight();
              },
              title: const Text("Dark Mode")),
        ),
      ),
    );
  }
}
