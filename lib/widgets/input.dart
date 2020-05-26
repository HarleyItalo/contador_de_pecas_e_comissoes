import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  final String labelText;
  final bool isObscure;
  final icon;
  final onChaged;
  final TextInputType keyboardtype;
  final validate;
  final String mask;
  final dynamic value;
  final prefix;
  Input(
      {@required this.labelText,
      this.isObscure = false,
      this.icon,
      this.onChaged,
      this.keyboardtype = TextInputType.text,
      this.value,
      this.validate,
      this.prefix,
      this.mask = ""});

  @override
  Widget build(BuildContext context) {
    var controller;
    if (mask == "money") {
      controller = new MoneyMaskedTextController(
        precision: 2,
        initialValue: value ?? "0.0",
      );
    } else if (mask == "cpf") {
      controller =
          new MaskedTextController(mask: "000.000.000.00 ", text: value);
    } else if (mask.isNotEmpty) {
      controller = new MaskedTextController(mask: mask, text: value);
    } else {
      controller = new TextEditingController(text: value);
    }
    controller.addListener(() {
      if (mask == "cpf") {
        var maskedController = controller as MaskedTextController;
        if (maskedController.text.length > 14 &&
            maskedController.text.contains(' ')) {
          maskedController.updateMask("00.000.000/0000-00");
        } else if (maskedController.text.length < 14 &&
            maskedController.text.contains('/')) {
          maskedController.updateMask("000.000.000.00 ");
        }
      }
      onChaged(controller.text);
    });
    var field = TextFormField(
      obscureText: isObscure,
      controller: controller,
      enableSuggestions: true,
      autocorrect: false,
      validator: validate,
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: prefix,
        icon: (icon != null)
            ? Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
              )
            : null,
      ),
      keyboardType: keyboardtype,
    );
    return SizedBox(key: key, height: 80, child: field);
  }
}
