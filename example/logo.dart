import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StyledWidgetLogo(),
      ),
    );
  }
}

class StyledWidgetLogo extends StatefulWidget {
  @override
  _StyledWidgetLogoState createState() => _StyledWidgetLogoState();
}

class _StyledWidgetLogoState extends State<StyledWidgetLogo> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Image.network(
              'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn.onlinewebfonts.com%2Fsvg%2Fimg_472874.png&f=1&nofb=1')
          .constraints(width: 50),
      Text('styled_widget').bold().fontSize(40)
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        .padding(all: 20)
        .backgroundColor(Colors.amber)
        .constraints(width: 400)
        .scale(3)
        .alignment(Alignment.center);
  }
}
