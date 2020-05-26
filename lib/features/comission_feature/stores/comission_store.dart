import 'package:contador_pecas/features/comission_feature/models/comission.dart';
import 'package:mobx/mobx.dart';
part 'comission_store.g.dart';

class ComissionStore = _ComissionStoreBase with _$ComissionStore;

abstract class _ComissionStoreBase with Store {
  @observable
  double comission = 0.0;

  _ComissionStoreBase() {
    getComission();
  }

  getComission() async {
    var value = await Comission.getComissionValue();
    if (value != null) {
      comission = value;
    }
  }

  setComissionValue(double value) async {
    await Comission.setComissionValue(value);
    comission = value;
  }
}
