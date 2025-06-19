//importar entities y repositories
import '../../domain/entities/student.dart';
import '../../data/repositories/order_repositories_impl.dart';

class StudentUserCases {
  final StudentRepositoryImpl studentRepository;

  StudentUserCases(this.studentRepository);

  Future<List<Student>> getStudents() async {
    return await studentRepository.getStudents();
  }

  Future<Student> createStudent(Student student) async {
    return await studentRepository.createStudent(student);
  }

  // Future<Student> updateStudent(Student student) async {
  //   return await studentRepository.updateStudent(student);
  // }

  // Future<void> deleteStudent(int id) async {
  //   return await studentRepository.deleteStudent(id);
  // }
}
