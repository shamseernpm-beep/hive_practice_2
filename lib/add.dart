import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your age",
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Save")),
            ),
          ],
        ),
      ),
    );
  }
}
