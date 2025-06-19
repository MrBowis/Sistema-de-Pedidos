 class Grades {
  final int id;
  final String subject;
  final double grade;
  final String studentId;

  Grades({
    required this.id,
    required this.subject,
    required this.grade,
    required this.studentId,
  });

  @override
  String toString() {
    return 'Grades(subject: $subject, grade: $grade), studentId: $studentId';
  }

  factory Grades.fromJson(Map<String, dynamic> json) {
    return Grades(
      id: json['id'] as int,
      subject: json['materia'] as String,
      grade: double.parse(json['calificacion'].toString()),
      studentId: json['estudiante'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'materia': subject,
      'calificacion': grade,
      'estudiante': studentId,
    };
  }
}