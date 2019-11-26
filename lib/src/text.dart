import 'package:flutter/widgets.dart';
/*
Style methods specific for the [Text] widget should be applied here
*/

extension TextExtension on Text {
  Text copyWith({
    TextStyle style,
    StrutStyle strutStyle,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
    TextWidthBasis textWidthBasis,
  }) =>
      Text(
        this.data,
        style: style ?? this.style,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        locale: locale ?? this.locale,
        maxLines: maxLines ?? this.maxLines,
        overflow: overflow ?? this.overflow,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        softWrap: softWrap ?? this.softWrap,
        textDirection: textDirection ?? this.textDirection,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        textWidthBasis: textWidthBasis ?? textWidthBasis,
      );

  Text bold() => this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(fontWeight: FontWeight.bold));

  Text fontWeight(FontWeight fontWeight) => this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(fontWeight: fontWeight));

  Text color(Color color) =>
      this.copyWith(style: (this.style ?? TextStyle()).copyWith(color: color));

  Text textAlign(TextAlign align) => this.copyWith(textAlign: align);

  Text textDirection(TextDirection direction) =>
      this.copyWith(textDirection: direction);
}
