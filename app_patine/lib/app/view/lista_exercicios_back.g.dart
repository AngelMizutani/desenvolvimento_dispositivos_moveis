// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of 'lista_exercicios_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaExerciciosBack on _ListaExerciciosBack, Store {
  final _$listaAtom = Atom(name: '_ListaExerciciosBack.lista');

  @override
  Future<List<Exercicio>> get lista {
    _$listaAtom.reportRead();
    return super.lista;
  }

  @override
  set lista(Future<List<Exercicio>> value) {
    _$listaAtom.reportWrite(value, super.lista, () {
      super.lista = value;
    });
  }

  final _$_ListaExerciciosBackActionController =
      ActionController(name: '_ListaExerciciosBack');

  @override
  dynamic atualizarListaExercicios([dynamic value]) {
    final _$actionInfo = _$_ListaExerciciosBackActionController.startAction(
        name: '_ListaExerciciosBack.atualizarListaExercicios');
    try {
      return super.atualizarListaExercicios(value);
    } finally {
      _$_ListaExerciciosBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lista: ${lista}
    ''';
  }
}
