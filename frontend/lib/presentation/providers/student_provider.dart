//importar riverpod, entities, datasource, repositories, usercases
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/student.dart';
import '../../data/datasource/student_api.dart';
import '../../data/repositories/order_repositories_impl.dart';
import '../../application/usercases/student_usercases.dart';

final studentProvider =
    StateNotifierProvider<StudentNotifier, AsyncValue<List<Student>>>((ref) {
      return StudentNotifier();
    });

final studentApiProvider = Provider<StudentApi>((ref) {
  return StudentApi();
});

final studentRepositoryProvider = Provider<StudentRepositoryImpl>((ref) {
  final studentApi = ref.watch(studentApiProvider);
  return StudentRepositoryImpl(studentApi);
});

final studentUserCasesProvider = Provider<StudentUserCases>((ref) {
  final studentRepository = ref.watch(studentRepositoryProvider);
  return StudentUserCases(studentRepository);
});

class StudentNotifier extends StateNotifier<AsyncValue<List<Student>>> {
  final StudentUserCases studentUserCases = StudentUserCases(
    StudentRepositoryImpl(StudentApi()),
  );
  StudentNotifier() : super(AsyncValue.loading()) {
    fetchStudents();
  }

  void fetchStudents() async {
    try {
      final students = await studentUserCases.getStudents();
      state = AsyncValue.data(students);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> createStudent(Student student) async {
    try {
      final newStudent = await studentUserCases.createStudent(student);
      state = AsyncValue.data([...state.value ?? [], newStudent]);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Future<void> updateStudent(Student student) async {
  //   try {
  //     final updatedStudent = await studentUserCases.updateStudent(student);
  //     final students =
  //         state.value
  //             ?.map((c) => c.id == updatedStudent.id ? updatedStudent : c)
  //             .toList() ??
  //         [];
  //     state = AsyncValue.data(students);
  //   } catch (e) {
  //     state = AsyncValue.error(e, StackTrace.current);
  //   }
  // }

  // Future<void> deleteStudent(int id) async {
  //   try {
  //     await studentUserCases.deleteStudent(id);
  //     final students = state.value?.where((c) => c.id != id).toList() ?? [];
  //     state = AsyncValue.data(students);
  //   } catch (e) {
  //     state = AsyncValue.error(e, StackTrace.current);
  //   }
  // }
}
