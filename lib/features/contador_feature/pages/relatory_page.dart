import 'package:contador_pecas/config/constants.dart';
import 'package:contador_pecas/features/comission_feature/stores/comission_store.dart';
import 'package:contador_pecas/features/contador_feature/models/counter.dart';
import 'package:contador_pecas/features/contador_feature/stores/count_store.dart';
import 'package:contador_pecas/utils/alert_util.dart';
import 'package:contador_pecas/utils/date_util.dart';
import 'package:contador_pecas/utils/navigation_util.dart';
import 'package:contador_pecas/utils/number_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'widgets/relatory_card.dart';

class RelatoryPage extends StatefulWidget {
  @override
  _RelatoryPageState createState() => _RelatoryPageState();
}

class _RelatoryPageState extends State<RelatoryPage> {
  final counterStore = GetIt.instance.get<CountStore>();
  final comissionStore = GetIt.instance.get<ComissionStore>();

  @override
  void initState() {
    super.initState();
    counterStore.getHistory();
    counterStore.updateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relatórios"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Observer(
            builder: (_) {
              return Container(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RelatoryCard(
                      icon: Icons.add_shopping_cart,
                      quantity: "${counterStore.valueOfWeek}",
                      title: "Essa semana",
                      color: Colors.redAccent,
                    ),
                    RelatoryCard(
                      icon: Icons.shopping_cart,
                      quantity: "${counterStore.valueOfMonth}",
                      title: "Esse mês",
                      color: Colors.greenAccent,
                    ),
                    RelatoryCard(
                      icon: Icons.monetization_on,
                      quantity:
                          "R\$ ${NumberUtil.money(counterStore.valueOfMonth * comissionStore.comission)}",
                      title: "Comissão do mês",
                      color: Colors.greenAccent,
                    ),
                    RelatoryCard(
                      icon: Icons.monetization_on,
                      quantity:
                          "R\$ ${NumberUtil.money(counterStore.valueOfMonth * comissionStore.comission)}",
                      title: "Comissão da semana",
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              );
            },
          ),
          Observer(
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  itemCount: counterStore?.daysHistory?.length ?? 0,
                  itemBuilder: (_, i) {
                    var item = counterStore.daysHistory[i];
                    return ListTile(
                      title:
                          Text(DateUtil.formatData(item, format: "dd/MM/yyyy")),
                      leading: Icon(Icons.calendar_today),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () async {
                        await counterStore.getHistoryFromDate(
                          date: item,
                        );
                        NavigationUtil.pushNamed(
                          relatory_detail,
                          args: item,
                        );
                      },
                      onLongPress: () {
                        AlertUtil.showQuestion(context,
                            title: "Espera!",
                            body:
                                "Tem certeza que deseja excluir este dia do histórico?",
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Counter.removeKey(item);
                                  counterStore.getHistory();
                                  counterStore.getDailyCount();
                                  NavigationUtil.pop();
                                },
                                child: Text("Sim",
                                    style: TextStyle(color: Colors.redAccent)),
                              ),
                              FlatButton(
                                onPressed: () {
                                  NavigationUtil.pop();
                                },
                                child: Text(
                                  "Não",
                                  style: TextStyle(color: Colors.greenAccent),
                                ),
                              )
                            ]);
                      },
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
