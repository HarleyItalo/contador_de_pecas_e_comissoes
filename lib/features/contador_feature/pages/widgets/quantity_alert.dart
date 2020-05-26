import 'package:contador_pecas/features/contador_feature/stores/count_store.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class QuantityAlert extends StatelessWidget {
  const QuantityAlert({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.counterStore,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final CountStore counterStore;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Informe a quantidade"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              icon: Icon(
            Icons.library_add,
          )),
          style: TextStyle(fontSize: 20),
          maxLength: 4,
          onSaved: (value) {
            var quantity = int.tryParse(value);
            if (quantity != null) {
              counterStore.increment(value: quantity);
              NavigationUtil.pop();
            }
          },
          validator: (value) {
            if (value == null) {
              return "Você deve preencher o campo de texto";
            }
            if (value.isEmpty) {
              return "Você deve preencher o campo de texto";
            }
            var valueInt = int.tryParse(value);
            if (valueInt == null || valueInt == 0) {
              return "O valor tem que ser maior que zero";
            }
            return null;
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
            }
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}
