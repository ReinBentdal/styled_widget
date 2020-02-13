# Styled_widget
<a href="https://pub.dev/packages/styled_widget"><img src="https://img.shields.io/pub/v/styled_widget"></a><br />
<a href="https://www.buymeacoffee.com/tOTWBs7"><img src="https://camo.githubusercontent.com/be06971baed9105260e0ed5c03746108c30b527f/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f64656661756c742d6f72616e67652e706e67" alt="Buy Me A Coffee" data-canonical-src="https://cdn.buymeacoffee.com/buttons/default-orange.png" width="150px" /></a>

Simplifying your widget tree structure by using a method based widget tree, inspired by SwiftUI.

If you like the package, consider giving the package a :star: on [GitHub](https://github.com/ReinBentdal/styled_widget) or a :thumbsup: on [pub](https://pub.dev/packages/styled_widget)!

**To read about how this package works and how to use it, visit the [wiki](https://github.com/ReinBentdal/styled_widget/wiki)**

### Built with styled_widget
| [App designer](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/styled_widget/blob/master/example/homepage_example.dart) |
|-|
|<img src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/demo_app.gif" width="250">|

## Introduction

### Basic Example
```dart
@override
Widget build(BuildContext context) => FlutterLogo()
  .padding(all: 20)
  .backgroundColor(Colors.blue)
  .constraints(width: 100, height: 100)
  .borderRadius(all: 10)
  .elevation(10)
  .alignment(Alignment.center);
```
<details>
  <summary>Native Flutter equivilent</summary>

  ```dart
  Align(
    alignment: Alignment.center,
    child: DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x55000000),
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 100, height: 100),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
    ),
  ),
  ```
</details>

#### Result
<img src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/example_1.jpg">

### Example
```dart
Text('some text')
  .textColor(Colors.white)
  .bold()
  .alignment(Alignment.center) // aligns text
  .constraints(width: 100, height: 100)
  .ripple()
  .backgroundColor(Colors.blue)
  .borderRadius(all: 10)
  .elevation(10)
  .alignment(Alignment.center), // aligns widget
Icon(Icons.portable_wifi_off)
  .iconColor(Colors.yellow)
  .iconSize(24)
  .padding(all: 30)
  .backgroundColor(Colors.amber),
```

<details>
  <summary>Native Flutter equivilent</summary>

  ```dart
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
  ```
</details>

#### Result
<img width="300" src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/code_demo.png">
