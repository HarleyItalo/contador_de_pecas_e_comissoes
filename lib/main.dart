import 'package:contador_pecas/features/comission_feature/stores/comission_store.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'config/routes.dart';
import 'features/contador_feature/stores/count_store.dart';

void main() {
  GetIt.instance.registerLazySingleton(
    () => CountStore(),
  );
  GetIt.instance.registerLazySingleton<ComissionStore>(() => ComissionStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de peças de roupa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      routes: route,
      navigatorKey: NavigationUtil.navigatorKey,
    );
  }
}
