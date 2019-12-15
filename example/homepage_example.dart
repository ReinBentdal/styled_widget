// App design: https://dribbble.com/shots/6459693-Creative-layout-design

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: UserPage()),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final page = ({Widget child}) => Styled.widget(child: child)
        .padding(vertical: 30, horizontal: 20)
        .constraints(minHeight: MediaQuery.of(context).size.height - (2 * 30))
        .scrollable();

    return page(
      child: <Widget>[
        Text('User settings')
            .bold()
            .fontSize(32)
            .alignment(Alignment.center)
            .padding(bottom: 20),
        UserCard(),
        ActionsRow(),
        Settings(),
      ].toColumn(),
    );
  }
}

class UserCard extends StatelessWidget {
  Widget _buildUserRow() {
    return <Widget>[
      Icon(Icons.account_circle)
          .backgroundColor(Colors.white)
          .borderRadius(all: 30)
          .constraints(height: 50, width: 50)
          .padding(right: 10),
      <Widget>[
        Text('Rein Gundersen Bentdal')
            .textColor(Colors.white)
            .fontSize(18)
            .fontWeight(FontWeight.w600)
            .padding(bottom: 5),
        Text('Creative builder')
            .textColor(Colors.white.withOpacity(0.6))
            .fontSize(12),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  Widget _buildUserStats() {
    return <Widget>[
      _buildUserStatsItem('846', 'Collect'),
      _buildUserStatsItem('51', 'Attention'),
      _buildUserStatsItem('267', 'Track'),
      _buildUserStatsItem('39', 'Coupons'),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(vertical: 10);
  }

  Widget _buildUserStatsItem(String value, String text) => <Widget>[
        Text(value).fontSize(20).textColor(Colors.white).padding(bottom: 5),
        Text(text).textColor(Colors.white.withOpacity(0.6)).fontSize(12),
      ].toColumn();

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildUserRow(), _buildUserStats()]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 20, vertical: 10)
        .backgroundColor(Color(0xff3977ff))
        .borderRadius(all: 20)
        .elevation(10, color: Color(0xff3977ff))
        .height(175)
        .alignment(Alignment.center);
  }
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionItem(String name, IconData icon) {
    final Widget actionIcon = Icon(icon)
        .iconSize(20)
        .iconColor(Color(0xFF42526F))
        .alignment(Alignment.center)
        .ripple()
        .constraints(width: 50, height: 50)
        .backgroundColor(Color(0xfff6f5f8))
        .clipOval()
        .padding(bottom: 5);

    final Widget actionText =
        Text(name).textColor(Colors.black.withOpacity(0.8)).fontSize(12);

    return <Widget>[
      actionIcon,
      actionText,
    ].toColumn().padding(vertical: 20);
  }

  @override
  Widget build(BuildContext context) => <Widget>[
        _buildActionItem('Wallet', Icons.attach_money),
        _buildActionItem('Delivery', Icons.card_giftcard),
        _buildActionItem('Message', Icons.message),
        _buildActionItem('Service', Icons.room_service),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
}

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  const SettingsItemModel({
    @required this.color,
    @required this.description,
    @required this.icon,
    @required this.title,
  });
}

const List<SettingsItemModel> settingsItems = [
  SettingsItemModel(
    icon: Icons.location_on,
    color: Color(0xff8D7AEE),
    title: 'Address',
    description: 'Ensure your harvesting address',
  ),
  SettingsItemModel(
    icon: Icons.lock,
    color: Color(0xffF468B7),
    title: 'Privacy',
    description: 'System permission change',
  ),
  SettingsItemModel(
    icon: Icons.menu,
    color: Color(0xffFEC85C),
    title: 'General',
    description: 'Basic functional settings',
  ),
  SettingsItemModel(
    icon: Icons.notifications,
    color: Color(0xff5FD0D3),
    title: 'Notifications',
    description: 'Take over the news in time',
  ),
  SettingsItemModel(
    icon: Icons.question_answer,
    color: Color(0xffBFACAA),
    title: 'Support',
    description: 'We are here to help',
  ),
];

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) => settingsItems
      .map((settingsItem) => SettingsItem(
            settingsItem.icon,
            settingsItem.color,
            settingsItem.title,
            settingsItem.description,
          ))
      .toList()
      .toColumn();
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String description;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final settingsItem = ({Widget child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white)
        .borderRadius(all: 15)
        .constraints(height: 70)
        .elevation(
          pressed ? 0 : 50,
          color: Colors.grey,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeOut,
        )
        .gestures(onTapChange: (tapStatus) => setState(() => pressed = tapStatus))
        .padding(vertical: 10)
        .scale(
          pressed ? 0.95 : 1.0,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeOut,
        );

    final Widget icon = Icon(widget.icon)
        .iconColor(Colors.white)
        .iconSize(20)
        .padding(all: 12)
        .backgroundColor(widget.iconBgColor)
        .borderRadius(all: 30)
        .padding(left: 15, right: 10);

    final Widget title =
        Text(widget.title).bold().fontSize(16).padding(bottom: 5);

    final Widget description =
        Text(widget.description).textColor(Colors.black26).bold().fontSize(12);

    return settingsItem(
      child: <Widget>[
        icon,
        <Widget>[
          title,
          description,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}
