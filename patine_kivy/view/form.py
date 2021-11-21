from kivy.app import App
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.lang.builder import Builder

Builder.load_file("view/form.kv")
class Form(Screen):
    def __init__(self, **kw):
        super().__init__(**kw)

class FormApp(App):
    def build(self):
        return Form()
