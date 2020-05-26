import 'package:shared_preferences/shared_preferences.dart';

class Comission {
  static Future<double> getComissionValue() async {
    var instance = await SharedPreferences.getInstance();
    return instance.getDouble("comissao");
  }

  static setComissionValue(double valorComissao) async {
    var instance = await SharedPreferences.getInstance();
    instance.setDouble("comissao", valorComissao);
  }
}
