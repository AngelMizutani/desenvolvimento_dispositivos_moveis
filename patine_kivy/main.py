from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from view.exercicios import TelaExercicios, Exercicio
from view.form import Form
class Gerenciador(ScreenManager):
    pass
class Main(App):
    def build(self):
        return Gerenciador()

Main().run()