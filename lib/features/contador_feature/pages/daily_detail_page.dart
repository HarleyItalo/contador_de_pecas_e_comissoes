import 'package:contador_pecas/features/contador_feature/models/counter.dart';
import 'package:contador_pecas/features/contador_feature/stores/count_store.dart';
import 'package:contador_pecas/utils/alert_util.dart';
import 'package:contador_pecas/utils/date_util.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DailyDetailPage extends StatelessWidget {
  final counterStore = GetIt.instance.get<CountStore>();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(DateUtil.formatData(args, format: "dd/MM/yyyy")),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              var list = counterStore?.dailyHistory;
              var quantidadeDiaria = 0;
              list.forEach((element) {
                quantidadeDiaria += element.value;
              });
              return Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text("Total: $quantidadeDiaria"),
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: counterStore?.dailyHistory?.length ?? 0,
                  itemBuilder: (_, i) {
                    var item = counterStore.dailyHistory[i];
                    return ListTile(
                      leading: Icon(Icons.check_circle),
                      title: Text(
                        "Quantidade: ${item.value}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        "Hora: ${DateUtil.formatData(item.dateTime, format: 'HH:mm')}",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () async {
                                AlertUtil.showQuestion(context,
                                    title: "Espera!",
                                    body:
                                        "Tem certeza que deseja excluir este lançamento?",
                                    actions: [
                                      FlatButton(
                                        onPressed: () async {
                                          counterStore.dailyHistory
                                              .remove(item);
                                          await Counter.saveOnkey(
                                              key: args,
                                              value: counterStore.dailyHistory
                                                  .toList());
                                          await counterStore.updateValues();
                                          NavigationUtil.pop();
                                        },
                                        child: Text("Sim",
                                            style: TextStyle(
                                                color: Colors.redAccent)),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          NavigationUtil.pop();
                                        },
                                        child: Text(
                                          "Não",
                                          style: TextStyle(
                                              color: Colors.greenAccent),
                                        ),
                                      )
                                    ]);
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
