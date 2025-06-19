import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/grades.dart';

class GradeCard extends StatelessWidget {
  final Grades grades;

  const GradeCard({Key? key, required this.grades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text((grades.subject.isNotEmpty ? grades.subject[0] : '?')),
        ),
        title: Text(grades.subject),
        subtitle: Text('Calificación: ${grades.grade}'),
      ),
    );
  }
}
