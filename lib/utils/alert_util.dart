import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertUtil {
  static showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, {text}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      elevation: 5,
      content: Text(text),
      duration: Duration(seconds: 2),
    ));
  }

  static showAlert(context, {title, body}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var content = new Text(
          body ?? " ",
          style: Theme.of(context).textTheme.subtitle1,
        );
        var titleWidget = Text(
          title ?? " ",
          style: Theme.of(context).textTheme.headline6,
        );
        var actions = [
          FlatButton(
            child: Text("OK", style: Theme.of(context).textTheme.subtitle1),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ];
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          return CupertinoAlertDialog(
            title: titleWidget,
            content: content,
            actions: actions,
          );
        }
        return AlertDialog(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: titleWidget,
            content: content,
            actions: actions);
      },
    );
  }

  static showQuestion(context, {title, body, @required List<Widget> actions}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var content = new Text(
          body ?? " ",
          style: Theme.of(context).textTheme.subtitle1,
        );
        var titleWidget = Text(
          title ?? " ",
          style: Theme.of(context).textTheme.headline6,
        );
        if (Theme.of(context).platform == TargetPlatform.iOS) {
          return CupertinoAlertDialog(
            title: titleWidget,
            content: content,
            actions: actions,
          );
        }
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: titleWidget,
          content: content,
          actions: actions,
        );
      },
    );
  }
}
