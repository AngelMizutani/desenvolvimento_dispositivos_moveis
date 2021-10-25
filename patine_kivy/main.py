import kivy
from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.core.window import Window
from kivy.uix.scrollview import ScrollView
from kivy.clock import Clock

class Gerenciador(ScreenManager):
    pass

class Menu(Screen):
    pass

class ListaExercicios(Screen):
    def __init__(self, exercicios=[], **kw):
        super().__init__(**kw)
        
        for exercicio in exercicios:
            self.ids.box_exercicio.add_widget(Exercicio(nome_exercicio=exercicio))

    def addWidget(self):
        nome = self.ids.texto_nome.text
        self.ids.box_exercicio.add_widget(Exercicio(nome_exercicio=nome))
        self.ids.texto_nome.text = ''

class Exercicio(BoxLayout):
    def __init__(self, nome_exercicio='', **kwargs):
        super().__init__(**kwargs)
        self.ids.nome_exercicio.text = nome_exercicio

class Telas(App):
    def build(self):
        return Gerenciador()

Telas().run()