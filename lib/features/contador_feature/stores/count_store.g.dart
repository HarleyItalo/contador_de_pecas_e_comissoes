// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountStore on _CountStoreBase, Store {
  final _$dailyCountAtom = Atom(name: '_CountStoreBase.dailyCount');

  @override
  int get dailyCount {
    _$dailyCountAtom.reportRead();
    return super.dailyCount;
  }

  @override
  set dailyCount(int value) {
    _$dailyCountAtom.reportWrite(value, super.dailyCount, () {
      super.dailyCount = value;
    });
  }

  final _$valueToAddAtom = Atom(name: '_CountStoreBase.valueToAdd');

  @override
  int get valueToAdd {
    _$valueToAddAtom.reportRead();
    return super.valueToAdd;
  }

  @override
  set valueToAdd(int value) {
    _$valueToAddAtom.reportWrite(value, super.valueToAdd, () {
      super.valueToAdd = value;
    });
  }

  final _$valueOfWeekAtom = Atom(name: '_CountStoreBase.valueOfWeek');

  @override
  int get valueOfWeek {
    _$valueOfWeekAtom.reportRead();
    return super.valueOfWeek;
  }

  @override
  set valueOfWeek(int value) {
    _$valueOfWeekAtom.reportWrite(value, super.valueOfWeek, () {
      super.valueOfWeek = value;
    });
  }

  final _$valueOfMonthAtom = Atom(name: '_CountStoreBase.valueOfMonth');

  @override
  int get valueOfMonth {
    _$valueOfMonthAtom.reportRead();
    return super.valueOfMonth;
  }

  @override
  set valueOfMonth(int value) {
    _$valueOfMonthAtom.reportWrite(value, super.valueOfMonth, () {
      super.valueOfMonth = value;
    });
  }

  final _$dailyHistoryAtom = Atom(name: '_CountStoreBase.dailyHistory');

  @override
  ObservableList<Counter> get dailyHistory {
    _$dailyHistoryAtom.reportRead();
    return super.dailyHistory;
  }

  @override
  set dailyHistory(ObservableList<Counter> value) {
    _$dailyHistoryAtom.reportWrite(value, super.dailyHistory, () {
      super.dailyHistory = value;
    });
  }

  final _$daysHistoryAtom = Atom(name: '_CountStoreBase.daysHistory');

  @override
  List<String> get daysHistory {
    _$daysHistoryAtom.reportRead();
    return super.daysHistory;
  }

  @override
  set daysHistory(List<String> value) {
    _$daysHistoryAtom.reportWrite(value, super.daysHistory, () {
      super.daysHistory = value;
    });
  }

  final _$updateValuesAsyncAction = AsyncAction('_CountStoreBase.updateValues');

  @override
  Future updateValues() {
    return _$updateValuesAsyncAction.run(() => super.updateValues());
  }

  final _$_CountStoreBaseActionController =
      ActionController(name: '_CountStoreBase');

  @override
  dynamic increment({int value = 1}) {
    final _$actionInfo = _$_CountStoreBaseActionController.startAction(
        name: '_CountStoreBase.increment');
    try {
      return super.increment(value: value);
    } finally {
      _$_CountStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dailyCount: ${dailyCount},
valueToAdd: ${valueToAdd},
valueOfWeek: ${valueOfWeek},
valueOfMonth: ${valueOfMonth},
dailyHistory: ${dailyHistory},
daysHistory: ${daysHistory}
    ''';
  }
}
