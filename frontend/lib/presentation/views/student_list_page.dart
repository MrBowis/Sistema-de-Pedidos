import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/presentation/providers/student_provider.dart';
import 'package:frontend/presentation/widgets/student_card.dart';

class StudentListPage extends ConsumerWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentState = ref.watch(studentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(studentProvider.notifier).fetchStudents();
            },
          )
        ],
      ),
      body: studentState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error: $error')),
        data: (students) {
          if (students.isEmpty) {
            return const Center(child: Text('No students found.'));
          }
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return StudentCard(student: students[index]);
            },
          );
        },
      ),
    );
  }
}
