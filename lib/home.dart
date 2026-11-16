import 'package:dummy_8/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dummy_8/service/sudent_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final service = StudentService();
  int? editIndex;

  final usernameController = TextEditingController();
  final ageController = TextEditingController();

  void click() async {
    String username = usernameController.text;
    String age = ageController.text;

    StudentModel student = StudentModel(
      name: username,
      age: int.tryParse(age.toString()) ?? 0,
    );

    if (editIndex == null) {
      await service.addData(student);
    } else {
      await service.update(editIndex!, student);
      editIndex = null;
    }
    if (!mounted) return;
    Navigator.pop(context);

    usernameController.clear();
    ageController.clear();
  }

  void press() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Fill your fields"),
          content: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your name",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "enter your age",
                ),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  click();
                },
                child: Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder(
          valueListenable: service.studentbox.listenable(),
          builder: (context, box, child) {
            final students = service.valueList();

            if (students.isEmpty) {
              return Center(child: Text("No Students Added yet"));
            }

            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];

                return Card(
                  child: ListTile(
                    title: Text(student.name),
                    subtitle: Text(student.age.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            usernameController.text = students[index].name;
                            ageController.text = students[index].age.toString();
                            editIndex = index;
                            press();
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () async {
                            await service.delete(index);
                          },
                          icon: Icon(Icons.delete_outline, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          press();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
