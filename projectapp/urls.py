from django.urls import path

from projectapp.views import ProjectCreateView, ProjectDetailView, ProjectListView, ProjectUpdateView

app_name = 'projectapp'

urlpatterns = [
    path('list/', ProjectListView.as_view(), name='list'),
    path('create/', ProjectCreateView.as_view(), name='create'),
    path('detail/<int:pk>', ProjectDetailView.as_view(), name='detail'),
    path('update/<int:pk>', ProjectUpdateView.as_view(), name='update'),
]