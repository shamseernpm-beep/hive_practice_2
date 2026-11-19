import 'dart:async';

import 'package:dummy_8/home.dart';
import 'package:dummy_8/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      then();
    });
  }

  void then() async {
    final save = await SharedPreferences.getInstance();
    final isLogged = save.getBool('login') ?? false;
    final username = save.getString('username') ?? "";
    if (!mounted) return;

    if (isLogged) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(username: username)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue);
  }
}
