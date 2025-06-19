from django.db import models

# Create your models here.
class Estudiante(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    fecha_nacimiento = models.DateField()

    def __str__(self):
        return f"{self.nombre} {self.apellido}"

    class Meta:
        verbose_name = 'Estudiante'
        verbose_name_plural = 'Estudiantes'
        ordering = ['apellido', 'nombre']

class Nota(models.Model):
    id = models.AutoField(primary_key=True)
    estudiante = models.ForeignKey(Estudiante, related_name='notas', on_delete=models.CASCADE)
    materia = models.CharField(max_length=100)
    calificacion = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return f"{self.estudiante.nombre} {self.estudiante.apellido} - {self.materia}: {self.calificacion}"

    class Meta:
        verbose_name = 'Nota'
        verbose_name_plural = 'Notas'
        ordering = ['estudiante', 'materia']