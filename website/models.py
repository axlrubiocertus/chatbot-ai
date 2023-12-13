from django.db import models

# Create your models here.
class Estudiantes(models.Model):
    class Meta:
        db_table = 't_estudiantes'

    codigo = models.CharField(max_length=8, db_column='cod_estudiante', primary_key=True, null=False)
    password = models.CharField(max_length=100, db_column='con_estudiante')
    nombre = models.CharField(max_length=100, db_column='nom_estudiante')
    apellido = models.CharField(max_length=100, db_column='ape_estudiante')


class Preguntas(models.Model):
    class Meta:
        db_table = 't_preguntas'

    id = models.AutoField(primary_key=True, db_column='id_pregunta')
    descripcion = models.TextField(null=False, db_column='descripcion')


class Respuestas(models.Model):
    class Meta:
        db_table = 't_respuestas'

    id = models.AutoField(primary_key=True, db_column='id_respuesta')
    pregunta = models.IntegerField(null=False, db_column='id_pregunta')
    descripcion = models.TextField(null=False, db_column='descripcion')


class PalabrasClave(models.Model):
    class Meta:
        db_table = 't_palabras_clave'

    id = models.AutoField(primary_key=True, db_column='id_palabra_clave')
    respuesta = models.IntegerField(null=False, db_column='id_respuesta')
    palabra = models.CharField(max_length=255, db_column='palabra')


class Historial(models.Model):
    class Meta:
        db_table = 't_historial'

    id = models.AutoField(primary_key=True, db_column='id_historial')
    titulo = models.CharField(max_length=200, null=False, db_column='titulo_conversacion')
    id_usuario = models.IntegerField(null=False, db_column='id_usuario')
    solicitud = models.TextField(null=True, db_column='solicitud')
    respuesta = models.TextField(null=True, db_column='respuesta')
    fecha_conversacion = models.DateField(null=False, auto_now_add=True, db_column='fecha_conversacion')
    activo = models.BooleanField(default=True)