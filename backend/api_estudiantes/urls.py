from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import EstudianteView

router = DefaultRouter()
router.register(r'estudiantes', EstudianteView)

urlpatterns = [
    path('', include(router.urls)),
]
