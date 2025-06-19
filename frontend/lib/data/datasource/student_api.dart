import '../../domain/entities/student.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentApi {
  final String baseUrl = 'http://127.0.0.1:8000/api-estudiantes/estudiantes/';

  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  //crear estudiante
  Future<Student> createStudent(Student student) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toJson()..remove('id')),
    );

    if (response.statusCode == 201) {
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create student');
    }
  }

  // //actualizar estudiante
  // Future<Student> updateStudent(Student student) async {
  //   final response = await http.put(
  //     Uri.parse('$baseUrl/${student.id}'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(student.toJson()),
  //   );

  //   if (response.statusCode == 200) {
  //     return Student.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to update student');
  //   }
  // }

  // //eliminar estudiante
  // Future<void> deleteStudent(int id) async {
  //   final response = await http.delete(Uri.parse('$baseUrl/$id'));

  //   if (response.statusCode != 204) {
  //     throw Exception('Failed to delete student');
  //   }
  // }
}
