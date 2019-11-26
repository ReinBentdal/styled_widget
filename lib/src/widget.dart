import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/*
Style methods which is common for all [Widget] widgets should be applied here.
*/

extension WidgetExtension on Widget {
  Widget padding(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      Padding(
          padding: EdgeInsets.only(
              top: top ?? vertical ?? all ?? 0.0,
              bottom: bottom ?? vertical ?? all ?? 0.0,
              left: left ?? horizontal ?? all ?? 0.0,
              right: right ?? horizontal ?? all ?? 0.0),
          child: this);

  Widget opacity(double value) {
    assert(value > 1.0 || value < 0);
    return Opacity(opacity: value, child: this);
  }

  Widget alignment(AlignmentGeometry align) =>
      Align(alignment: align, child: this);

  Widget backgroundColor(Color color) =>
      DecoratedBox(decoration: BoxDecoration(color: color), child: this);

  Widget borderRadius(
          {double all,
          double topLeft,
          double topRight,
          double bottomLeft,
          double bottomRight}) =>
      DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft ?? all ?? 0.0),
            topRight: Radius.circular(topRight ?? all ?? 0.0),
            bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
            bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
          )),
          child: this);

  Widget circle() => DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle), child: this);

  // Widget elevation(double elevation) => PhysicalShape(elevation: elevation, child: this);

  Widget constraints({
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
  }) =>
      ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: minWidth,
              maxWidth: maxWidth,
              minHeight: minHeight,
              maxHeight: maxHeight),
          child: this);

  Widget semanticsLabel(String label) => Semantics.fromProperties(properties: SemanticsProperties(label: label), child: this);
}
