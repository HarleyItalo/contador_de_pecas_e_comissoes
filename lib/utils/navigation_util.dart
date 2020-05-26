import 'package:flutter/material.dart';

class NavigationUtil {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  static String page = '';

  static void pushNamed(
    String name, {
    Object args,
  }) async {
    page = name;
    await navigatorKey.currentState.pushNamed(
      name,
      arguments: args,
    );
  }

  static void push(
    page,
  ) async {
    await navigatorKey.currentState.push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static void pushNamedAndRemoveUntil(
    String name, {
    Object args,
  }) async {
    page = name;
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      name,
      (route) => false,
    );
  }

  static void pop() {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }
}
