import 'package:dummy_8/model/student_model.dart';
import 'package:hive_flutter/adapters.dart';

class StudentService {
  final Box<StudentModel> studentBox = Hive.box<StudentModel>("List");

  Future<void> addData(StudentModel student) async {
    await studentBox.add(student);
  }

  List<StudentModel> valueList() {
    return studentBox.values.toList();
  }

  Future<void> update(int index, StudentModel student) async {
    await studentBox.putAt(index, student);
  }

  Future<void> delete(int index) async {
    await studentBox.deleteAt(index);
  }
}
