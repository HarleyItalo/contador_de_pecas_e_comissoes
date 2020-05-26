import 'package:contador_pecas/config/constants.dart';
import 'package:contador_pecas/features/comission_feature/pages/widgets/comission_alert.dart';
import 'package:contador_pecas/features/contador_feature/stores/count_store.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'widgets/quantity_alert.dart';

class CountPage extends StatelessWidget {
  final counterStore = GetIt.instance.get<CountStore>();
  final _formKey = GlobalKey<FormState>();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de roupas "),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              NavigationUtil.pushNamed(relatory_route);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Numero de peças vendidas hoje:",
                textAlign: TextAlign.center,
              ),
              Observer(
                builder: (_) {
                  return Text(
                    "${counterStore.dailyCount}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              RaisedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.create_new_folder,
                        size: 30,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Adicionar um pacote.",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    child: QuantityAlert(
                      formKey: _formKey,
                      counterStore: counterStore,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "config",
            child: Icon(Icons.settings),
            onPressed: () {
              showDialog(
                context: context,
                child: ComissionAlert(
                  formKey: _form,
                ),
              );
            },
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            heroTag: "add",
            label: Text("Adicionar"),
            isExtended: true,
            icon: Icon(
              Icons.exposure_plus_1,
            ),
            onPressed: () {
              counterStore.increment();
            },
          ),
        ],
      ),
    );
  }
}
