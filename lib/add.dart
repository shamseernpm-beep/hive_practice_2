import 'package:dummy_8/model/student_model.dart';
import 'package:dummy_8/service/student_service.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final service = StudentService();

  int? editIndex;
  final usernameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void press() async {
    final username = usernameController.text;
    final age = ageController.text;

    StudentModel student = StudentModel(
      name: username,
      age: int.tryParse(age.toString()) ?? 0,
    );
    await service.addData(student);
    if (editIndex == null) {
      await service.addData(student);
    } else {
      await service.update(editIndex!, student);
    }

    if (!mounted) return;

    Navigator.pop(context);

    usernameController.clear();
    ageController.clear();
  }

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
              child: ElevatedButton(
                onPressed: () async {
                  press();
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
