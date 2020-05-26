import 'package:contador_pecas/features/comission_feature/stores/comission_store.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:contador_pecas/utils/string_util.dart';
import 'package:contador_pecas/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ComissionAlert extends StatelessWidget {
  ComissionAlert({
    Key key,
    @required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final comissionStore = GetIt.instance.get<ComissionStore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Informe o valor de comissão"),
      content: Form(
        key: _formKey,
        child: Observer(
          builder: (_) {
            return Input(
              value: comissionStore.comission,
              mask: 'money',
              keyboardtype: TextInputType.number,
              prefix: "R\$ ",
              onChaged: (value) async {
                var valorComissao = StringUtil.parseStringToDouble(value);
                if (valorComissao != null) {
                  comissionStore.setComissionValue(valorComissao);
                }
              },
              validate: (value) {
                if (value == null) {
                  return "Você deve preencher o campo de texto";
                }
                if (value.isEmpty) {
                  return "Você deve preencher o campo de texto";
                }
                var valueInt = StringUtil.parseStringToDouble(value);
                if (valueInt == null || valueInt == 0) {
                  return "O valor tem que ser maior que zero";
                }
                return null;
              },
              labelText: '',
            );
          },
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () => NavigationUtil.pop(),
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              NavigationUtil.pop();
            }
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
