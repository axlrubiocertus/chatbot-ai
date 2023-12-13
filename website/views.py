from django.shortcuts import render, redirect
from .models import Estudiantes, Historial
from .ia.bot import Bot
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.serializers import serialize

def home(request):
    return redirect('iniciar-sesion')

# Create your views here.
def iniciar_sesion(request):
    login_error = request.session.get('login-error')
    user_session = request.session.get('user-session')

    if user_session != None:
        return redirect('panel')
    
    if 'login-error' in request.session:
        del request.session['login-error']

    return render(request, 'login.html', { 'login_error': login_error } )


def panel(request):
    user_session = request.session.get('user-session')

    if user_session == None:
        request.session.clear()
        return redirect('iniciar-sesion')
    
    list_conversations = Historial.objects.filter(id_usuario=user_session['codigo_estudiante']).values_list('titulo').distinct()

    return render(request, 'panel.html', { 
        'user_session' : user_session, 
        'conversaciones': None if len(list_conversations) < 1 else list_conversations 
    })


def cerrar_sesion(request):
    request.session.clear()
    return redirect('iniciar-sesion')


def verificar_usuario(request):
    if request.method == 'POST':
        # Obtenemos los datos por POST
        codigo_estudiante = request.POST.get('codigo')
        password_estudiante = request.POST.get('password')

        # Obtenemos el estudiante
        try:
            estudiante = Estudiantes.objects.get(codigo=codigo_estudiante, password=password_estudiante)

            request.session['user-session'] = {
                'codigo_estudiante' : estudiante.codigo,
                'nombre_estudiante' : estudiante.nombre,
                'apellido_estudiante' : estudiante.apellido
            }

            return redirect('panel')

        except Estudiantes.DoesNotExist:
            request.session['login-error'] = 'Credenciales incorrectos'
            return redirect('iniciar-sesion')

    else:
        return redirect('iniciar-sesion')
    

def crear_cuenta(request):
    create_account_error = request.session.get('create-account-error')
    user_session = request.session.get('user-session')

    if user_session != None:
        return redirect('panel')
    
    if 'create-account-error' in request.session:
        del request.session['create-account-error']

    return render(request, 'create-account.html', { 'create-account-error': create_account_error })


def crear_usuario(request):
    if request.method == 'POST':
        codigo = request.POST.get('codigo', None)
        nombre = request.POST.get('nombre', None)
        apellido = request.POST.get('apellido', None)
        password = request.POST.get('password', None)

        if codigo == None or nombre == None or apellido == None or password == None:
            request.session['create-account-error'] = 'Tienes campos vacios'
            return redirect('crear-cuenta')
        else:
            nuevo_estudiante = Estudiantes(codigo=codigo, nombre=nombre, apellido=apellido, password=password)
            nuevo_estudiante.save()

            return redirect('iniciar-sesion')
    else:
        # Manejar solicitudes GET u otros métodos
        return JsonResponse({'respuesta' : 'error de conexion'})

@csrf_exempt
def consultar_bot(request):
    if request.method == 'POST':
        bot = Bot()

        # Acceder a los datos POST
        datos_json = json.loads(request.body)

        # Accede a los datos JSON y a la consulta del usuario
        titulo_conversacion = datos_json.get('title')
        consulta = datos_json.get('message')

        # Respuesta del bot
        resultado_consulta = bot.get_response(consulta)

        # Guardado en la base de datos
        user_session = request.session.get('user-session')
        nueva_historia = Historial( titulo=titulo_conversacion, 
                                    id_usuario=user_session['codigo_estudiante'], 
                                    solicitud=consulta, 
                                    respuesta=resultado_consulta)
        
        # print(nueva_historia)
        nueva_historia.save()

        # Devolver una respuesta, por ejemplo, JSON
        response_data = { 'respuesta' : resultado_consulta }
        
        return JsonResponse(response_data)
    else:
        # Manejar solicitudes GET u otros métodos
        return JsonResponse({'respuesta' : 'error de conexion'})
    

def obtener_ultima_conversacion(request):
    lista_conversaciones = Historial.objects.all().values_list('titulo')
    conversaciones = []

    for conversacion in lista_conversaciones:
        conversaciones.append(int(conversacion[0].split(' - ')[0].replace('Conversacion #', '')))

    titulos = list(set(conversaciones))
    numero_conversacion = titulos[-1] + 1

    return JsonResponse({ 'numero_conversacion' : numero_conversacion })


@csrf_exempt
def obtener_conversacion_db(request):
    if request.method == 'POST':
        body = json.loads(request.body)
        conversaciones = Historial.objects.filter(titulo=body['titulo_conversacion_buscar'])
        lista_conversaciones = []

        for conversacion in conversaciones:
            lista_conversaciones.append({'solicitud': conversacion.solicitud, 'respuesta': conversacion.respuesta})

        return JsonResponse({'conversations' : lista_conversaciones})
    else:
        return JsonResponse({'message' : 'method error'})