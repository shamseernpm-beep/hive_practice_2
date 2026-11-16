import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final usernameController = TextEditingController();
  final ageController = TextEditingController();
  int? editIndex;

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

              ElevatedButton(onPressed: () {}, child: Text("Save")),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          press();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
