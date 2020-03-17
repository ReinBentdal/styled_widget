<p align="center" >
  <a href="https://pub.dev/packages/styled_widget">
    <img src="https://github.com/ReinBentdal/styled_widget/blob/master/example/assets/styled_widget.jpg?raw=true" height="150" />
  </a>
</p>

<br />

<p align="center" >
  <strong>Simplifying your widget tree structure by defining widgets using methods.</strong>
  <br />
  <br />
  <a href="https://pub.dev/packages/styled_widget"><img src="https://img.shields.io/pub/v/styled_widget?color=blue" /></a>&nbsp;&nbsp;
  <a href="https://www.buymeacoffee.com/tOTWBs7"><img src="https://camo.githubusercontent.com/be06971baed9105260e0ed5c03746108c30b527f/68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f64656661756c742d6f72616e67652e706e67" alt="Buy Me A Coffee" data-canonical-src="https://cdn.buymeacoffee.com/buttons/default-orange.png" width="150px" /></a>
</p>

<br />

Thanks to the introduction of [extension methods](https://dart.dev/guides/language/extension-methods) in Dart 2.7.0, `styled_widget` makes it possible to build widget tree\`s more readable and efficient. It is therefore much easier to focus on the actual design of your app.
```dart
final Widget button = Text('button')
  .bold()
  .padding(all: 5)
  .decorated(
    color: Colors.amber,
    borderRadius: BorderRadius.circular(3),
  );
```

### Showcase
| [Design](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/styled_widget/wiki/demo_app) | [Design](https://dribbble.com/shots/4514354-Sign-up), [Code](https://github.com/ReinBentdal/styled_widget/wiki/japan-style-example) | [Design](https://no.pinterest.com/pin/403283341630104104/), [Code](https://github.com/ReinBentdal/styled_widget/wiki/toggle) |
|-|-|-|
|<img src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/demo_app.gif"  width="250">|<img src="https://github.com/ReinBentdal/styled_widget/blob/master/example/assets/japan-style-example.gif?raw=true" width="250" />|<img src="https://github.com/ReinBentdal/styled_widget/blob/master/example/assets/toggle.gif?raw=true" width="250">|

### Docs
<strong>See the documentation at [styled_widget/wiki](https://github.com/ReinBentdal/styled_widget/wiki)</strong> for more information about using `styled_widget`!

<strong>Quicklinks</strong>
* [Home](https://github.com/ReinBentdal/styled_widget/wiki)
* [Core concept](https://github.com/ReinBentdal/styled_widget/wiki/Core-concept)
* [Widgets](https://github.com/ReinBentdal/styled_widget/wiki/Widgets)
* [Animations](https://github.com/ReinBentdal/styled_widget/wiki/Animations)
* [List of methods](https://github.com/ReinBentdal/styled_widget/wiki/List-of-methods)
* [Examples](https://github.com/ReinBentdal/styled_widget/wiki/Examples)
  * [demo app](https://github.com/ReinBentdal/styled_widget/wiki/demo_app)
  * [japan style](https://github.com/ReinBentdal/styled_widget/wiki/japan-style-example)
  * [toggle animation](https://github.com/ReinBentdal/styled_widget/wiki/toggle)
  * [styled_widget logo](https://github.com/ReinBentdal/styled_widget/wiki/styled_widget-logo)
  * [Basic text example](https://github.com/ReinBentdal/styled_widget/wiki/basic-text-example)
* [Contributing](https://github.com/ReinBentdal/styled_widget/wiki/Contributing)
