import 'package:flutter/material.dart';

class RelatoryCard extends StatelessWidget {
  const RelatoryCard({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.quantity,
    @required this.color,
  }) : super(key: key);

  final icon;
  final title;
  final quantity;
  final color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 170,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                quantity,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
