//importar student model, student_api
import '../../domain/entities/student.dart';
import '../datasource/student_api.dart';

class StudentRepositoryImpl {
  final StudentApi studentApi;

  StudentRepositoryImpl(this.studentApi);

  Future<List<Student>> getStudents() async {
    return await studentApi.fetchStudents();
  }

  Future<Student> createStudent(Student student) async {
    return await studentApi.createStudent(student);
  }
}
