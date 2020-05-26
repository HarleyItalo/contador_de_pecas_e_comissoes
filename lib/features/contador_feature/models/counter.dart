import 'dart:convert';

import 'package:contador_pecas/utils/date_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter {
  int value;
  String dateTime;

  Counter({this.dateTime, this.value});

  Counter.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['dateTime'] = this.dateTime;
    return data;
  }

  static removeKey(key) async {
    var instance = await SharedPreferences.getInstance();
    instance.remove(key);
  }

  static saveOnkey({key, List<Counter> value}) async {
    var instance = await SharedPreferences.getInstance();
    List<String> list = value
        .map(
          (element) => jsonEncode(element.toJson()),
        )
        .toList();
    instance.setStringList(key, list);
  }

  save() async {
    var date = DateUtil.formatData(
      DateTime.now(),
    );
    var instance = await SharedPreferences.getInstance();
    var counterList = await getAll(key: date);
    counterList.add(this);
    List<String> list = counterList
        .map(
          (element) => jsonEncode(element.toJson()),
        )
        .toList();
    instance.setStringList(date, list);
  }

  static Future<List<String>> getAllKeys() async {
    var instance = await SharedPreferences.getInstance();
    var keys = instance.getKeys().where((element) => element.contains("-"));

    var data = keys.toList();
    data.sort((a, b) => a.compareTo(b));

    return data.reversed.toList();
  }

  static Future<int> getCountOfKey(key) async {
    var counter = await getAll(key: key);
    var value = 0;
    counter.forEach((element) => value += element.value);
    return value;
  }

  static Future<int> getCountOfWeek() async {
    var dayWeek = DateTime.now().weekday;
    var quantity = 0;
    for (int i = dayWeek; i >= 0; i--) {
      quantity += await Counter.getCountOfKey(
          DateUtil.formatData(DateTime.now().add(Duration(days: i * -1))));
    }
    return quantity;
  }

  static Future<int> getCountOfMonth() async {
    var dayWeek = DateTime.now().day;
    var quantity = 0;
    for (int i = dayWeek; i >= 0; i--) {
      quantity += await Counter.getCountOfKey(
          DateUtil.formatData(DateTime.now().add(Duration(days: i * -1))));
    }
    return quantity;
  }

  static Future<List<Counter>> getAll({key}) async {
    var instance = await SharedPreferences.getInstance();
    final storedList = instance.getStringList(
      key ??
          DateUtil.formatData(
            DateTime.now(),
          ),
    );
    List<Counter> counterList = List<Counter>();
    if (storedList != null) {
      storedList.forEach(
        (e) => counterList.add(
          Counter.fromJson(
            jsonDecode(e),
          ),
        ),
      );
    }
    return counterList ?? List<Counter>();
  }
}
