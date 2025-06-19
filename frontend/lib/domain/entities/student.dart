import 'package:frontend/domain/entities/grades.dart';

class Student {
  final int id;
  final String name;
  final String lastname;
  final String birthdate;
  final List<Grades> grades = [];

  Student({
    required this.id,
    required this.name,
    required this.lastname,
    required this.birthdate,
    required List<Grades> grades,
  });

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, enterprise: $lastname, photo: $birthdate}';
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      name: json['nombre'] as String,
      lastname: json['apellido'] as String,
      birthdate: json['fecha_nacimiento'] as String,
      grades: (json['notas'] as List)
          .map((item) => Grades.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': name,
      'apellido': lastname,
      'fecha_nacimiento': birthdate,
      'notas': grades.map((item) => item.toJson()).toList(),
    };
  }
}
