"""
URL configuration for chatbotai project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from website import views as website_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', website_views.home, name="home"),
    path('iniciar-sesion/', website_views.iniciar_sesion, name='iniciar-sesion'),
    path('crear-cuenta/', website_views.crear_cuenta, name='crear-cuenta'),
    path('crear-usuario/', website_views.crear_usuario, name='crear-usuario'),
    path('verificar-usuario/', website_views.verificar_usuario, name='verificar-usuario'),
    path('panel/', website_views.panel, name='panel'),
    path('cerrar-sesion/', website_views.cerrar_sesion, name='cerrar-sesion'),
    path('bot/', website_views.consultar_bot, name='consultar-bot'),
    path('ultima_conversacion/', website_views.obtener_ultima_conversacion, name='obtener_ultima_conversacion'),
    path('obtener_conversacion_bd/', website_views.obtener_conversacion_db, name='obtener_coversacion_db')
]
