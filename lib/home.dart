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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
