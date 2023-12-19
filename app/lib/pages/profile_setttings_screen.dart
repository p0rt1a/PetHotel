import 'package:app/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Ayarları"),
      ),
      backgroundColor: HexColor(background),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("userid");
              if (!context.mounted) return;
              Navigator.pop(context);
            },
            child: const Text(
              "Çıkış Yap",
            )),
      ),
    );
  }
}
