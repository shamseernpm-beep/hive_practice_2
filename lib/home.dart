import 'package:dummy_8/add.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String? username;
  const Home({super.key, this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username!),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
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
