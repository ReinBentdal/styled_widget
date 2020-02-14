import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() => runApp(app);

final Widget app = MaterialApp(home: Scaffold(body: logo));

final Widget logo = <Widget>[
  Image
    .network('https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn.onlinewebfonts.com%2Fsvg%2Fimg_472874.png&f=1&nofb=1')
    .constraints(width: 50),
  Text('styled_widget').bold().fontSize(40),
]
    .toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly)
    .padding(all: 20)
    .backgroundColor(Colors.amber)
    .constraints(width: 400)
    .scale(3)
    .alignment(Alignment.center);