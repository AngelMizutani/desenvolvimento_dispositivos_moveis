from kivy.app import App
from kivy.core.window import Window
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.screenmanager import Screen
from kivy.lang.builder import Builder

Builder.load_file("view/exercicios.kv")

class TelaExercicios(Screen):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)

        # exercicios = [
        #     {'nome': 'Freio de Calcanhar', 'descricao': 'Use o freio do patins para parar'}, 
        #     {'nome':'Limões', 'descricao': 'Desenhe limões com os patins'}]

        # for exercicio in exercicios:
        #     self.ids.box.add_widget(Exercicio(nome=exercicio.nome, descricao=exercicio.descricao))

    def on_pre_enter(self):
        Window.bind(on_keyboard = self.voltar)

    def voltar(self, window, key, *args):
        if key == 27:
            App.get_running_app().root.current = 'menu'
            return True

    def on_pre_leave(self):
        Window.unbind(on_keyboard = self.voltar)

    # def addExercicio(self):
    #     texto = self.ids.texto_exercicio.text
    #     self.ids.box.add_widget(Exercicio(text = texto))
    #     self.ids.texto_exercicio.text = ''

class Exercicio(BoxLayout):
    def __init__(self, nome, descricao, **kwargs):
        super().__init__(**kwargs)
        self.ids.label_nome.text = nome
        self.ids.label_descricao.text = descricao


class ExerciciosApp(App):
    def build(self):
        return TelaExercicios()