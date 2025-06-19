import 'package:flutter/material.dart';
import 'package:frontend/domain/entities/student.dart';

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text((student.name.isNotEmpty ? student.name[0] : '?')),
        ),
        title: Text('${student.name} ${student.lastname}'),
        subtitle: Text('Birthdate: ${student.birthdate}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to student details page or perform an action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on ${student.name}')),
          );
        },
      ),
    );
  }
}
