import 'package:contador_pecas/features/contador_feature/models/counter.dart';
import 'package:mobx/mobx.dart';
part 'count_store.g.dart';

class CountStore = _CountStoreBase with _$CountStore;

abstract class _CountStoreBase with Store {
  @observable
  int dailyCount = 0;

  @observable
  int valueToAdd = 0;

  @observable
  int valueOfWeek = 0;

  @observable
  int valueOfMonth = 0;

  @observable
  ObservableList<Counter> dailyHistory;

  @observable
  List<String> daysHistory;

  @action
  updateValues() async {
    valueOfMonth = await Counter.getCountOfMonth();
    valueOfWeek = await Counter.getCountOfWeek();
    await getDailyCount();
  }

  @action
  increment({int value = 1}) {
    final counter = Counter(
      dateTime: DateTime.now().toString(),
      value: value,
    );
    counter.save();
    dailyCount += value;
  }

  getHistory() async {
    daysHistory = await Counter.getAllKeys();
  }

  getDailyCount() async {
    final counter = await Counter.getAll();
    dailyCount = 0;
    counter.forEach((element) => dailyCount += element.value);
  }

  getHistoryFromDate({date}) async {
    var list = await Counter.getAll(key: date);
    dailyHistory = list.asObservable();
  }

  _CountStoreBase() {
    updateValues();
  }
}
