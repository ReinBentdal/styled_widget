# styled_widget

## Notise
This package is an experimental package and is not in its current state ment to be used in a project.
This package is based on dart version 2.6.0 which is not currently supported by the current stable flutter version (1.9.1). Therefore you will have to move to the dev branch to use this package.
As this is a early consept package contributions to the idea is very welcome.

## Example
Make you code go from this
```dart
@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 100, height: 100),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'some text',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.amber),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Icon(
            Icons.portable_wifi_off,
            size: 24,
            color: Colors.yellow,
          ),
        ),
      ),
    ],
  );
}
```
to this
```dart
  final Widget textWidget = Text('some text')
      .textColor(Colors.white)
      .bold()
      .constraints(width: 100, height: 100)
      .backgroundColor(Colors.blue)
      .borderRadius(all: 10)
      .alignment(Alignment.center);

  final Widget iconWidget = Icon(Icons.portable_wifi_off)
    .iconColor(Colors.yellow)
    .iconSize(24)
    .padding(all: 30)
    .backgroundColor(Colors.amber);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        textWidget,
        iconWidget,
      ],
    );
  }
```

### Result

<img width="300" src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/code_demo.png">
