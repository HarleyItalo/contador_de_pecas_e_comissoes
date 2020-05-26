// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comission_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComissionStore on _ComissionStoreBase, Store {
  final _$comissionAtom = Atom(name: '_ComissionStoreBase.comission');

  @override
  double get comission {
    _$comissionAtom.reportRead();
    return super.comission;
  }

  @override
  set comission(double value) {
    _$comissionAtom.reportWrite(value, super.comission, () {
      super.comission = value;
    });
  }

  @override
  String toString() {
    return '''
comission: ${comission}
    ''';
  }
}
