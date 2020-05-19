<p align="center" >
  <a href="https://pub.dev/packages/styled_widget">
    <img src="https://github.com/ReinBentdal/styled_widget/raw/master/doc/assets/logo.png"  width="500">
  </a>
</p>

<br />

<p align="center" >
  <strong>Simplifying your widget tree structure by defining widgets using methods.</strong>
  <br />
  <br />
  <a href="https://pub.dev/packages/styled_widget"><img src="https://img.shields.io/pub/v/styled_widget?color=blue" /></a>&nbsp;&nbsp;
  <a href="https://www.buymeacoffee.com/tOTWBs7" target="_blank"><img width="150px" src="https://cdn.buymeacoffee.com/buttons/default-yellow.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>
</p>

<br />

Thanks to the introduction of [extension methods](https://dart.dev/guides/language/extension-methods) in Dart 2.7.0, `styled_widget` makes it possible to build widget tree\`s more readable and efficient.

`styled_widget` is build as a tool to enhance your Flutter development experience and to seamlessly integrate with your codebase. 

### Showcase
| [Design](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/styled_widget/wiki/demo_app) | [Design](https://dribbble.com/shots/4514354-Sign-up), [Code](https://github.com/ReinBentdal/styled_widget/wiki/japan-style-example) | [Design](https://no.pinterest.com/pin/403283341630104104/), [Code](https://github.com/ReinBentdal/styled_widget/wiki/toggle) |
|-|-|-|
|<img src="https://raw.githubusercontent.com/ReinBentdal/styled_widget/master/example/assets/demo_app.gif"  width="250">|<img src="https://github.com/ReinBentdal/styled_widget/blob/master/example/assets/japan-style-example.gif?raw=true" width="250" />|<img src="https://github.com/ReinBentdal/styled_widget/blob/master/example/assets/toggle.gif?raw=true" width="250">|

### Basic example
`styled_widget` has a **bottom up** approach to building widget\`s. This means you start with the inner most element and layer widget\`s on top. The following example is structured as follows:
Icon -> blue circle -> light blue circle -> card -> background
```dart
Icon(OMIcons.home, color: Colors.white)
  .padding(all: 10)
  .decorated(color: Color(0xff7AC1E7), shape: BoxShape.circle)
  .padding(all: 15)
  .decorated(color: Color(0xffE8F2F7), shape: BoxShape.circle)
  .padding(all: 20)
  .card(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  )
  .alignment(Alignment.center)
  .backgroundColor(Color(0xffEBECF1));
```
<details>
  <summary>Raw Flutter (click to show)</summary>
<pre>

```dart
DecoratedBox(
  decoration: BoxDecoration(
    color: Color(0xffEBECF1),
  ),
  child: Align(
    alignment: Alignment.center,
    child: Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xffE8F2F7),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xff7AC1E7),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  OMIcons.home,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ),
);
```
</pre>
</details>
<img width="400" src="https://github.com/ReinBentdal/styled_widget/blob/master/doc/assets/simple_demo.png?raw=true" />

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
