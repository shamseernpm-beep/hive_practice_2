import 'package:dummy_8/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void click() async {
    String username = usernameController.text;
    String pass = passwordController.text;

    if (username.isNotEmpty && pass.isNotEmpty) {
      final save = await SharedPreferences.getInstance();
      await save.setBool('login', true);
      await save.setString('username', username);
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(username: username)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text("please fill your fields"));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter your name",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "enter your Password",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      click();
                    },
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
