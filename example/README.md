# Example
```dart
Text('some text')
  .bold()
  .textColor(Colors.green)
  .alignment(Alignment.center)
```

For text with multiple styles:
```dart
Text.rich(TextSpan(
  text: 'Some text',
  children: [
    TextSpan(text: ' and some more text')
        .bold()
        .textColor(Colors.yellow),
  ],
))
```