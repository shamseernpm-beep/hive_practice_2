import 'package:dummy_8/add.dart';
import 'package:dummy_8/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatefulWidget {
  final String? username;
  const Home({super.key, this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final service = StudentService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username!),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
      ),
      body: ValueListenableBuilder(
        valueListenable: service.studentBox.listenable(),
        builder: (context, box, child) {
          final students = service.valueList();
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                elevation: 3,
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.age.toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Add(student: student, index: index),
                            ),
                          );
                        },
                        icon: Icon(Icons.edit, color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: () async {
                          await service.delete(index);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
