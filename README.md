# Styled_widget
<img src="https://img.shields.io/pub/v/styled_widget">

**This package requires Dart 2.6.0 or newer which implies a Flutter version supporting this Dart version. As of right now Flutter stable does not support these constraints**

- **[Introduction](#introduction)**
- **[Core Concepts](#core-concepts)**
  - [Widget Tree](#widget-tree)
- **[Contributing](#contributing)**

## Introduction

### Basic Example
```dart
final styledWidget = (Widget child) => Styled.widget(child)
    .padding(all: 20)
    .backgroundColor(Colors.blue)
    .constraints(width: 100, height: 100)
    .borderRadius(all: 10)
    .elevation(10)
    .alignment(Alignment.center);

@override
Widget build(BuildContext context) => styledWidget(FlutterLogo());
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

## Core Concepts
### Widget Tree

## Contributing
