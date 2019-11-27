# Styled_widget
**This package requires Dart 2.6.0 or newer**

- **[Introduction](#introduction)**
- **[Core Concepts](#core-concepts)**
  - [Observables](#observables)
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
#### Result
<img width="300" src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/code_demo.png">

## Core Concepts
### Widget tree
### 

## Contributing