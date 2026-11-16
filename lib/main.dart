import 'package:dummy_8/model/student_model.dart';
import 'package:dummy_8/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());
  await Hive.openBox<StudentModel>("List");
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash(), debugShowCheckedModeBanner: false);
  }
}
