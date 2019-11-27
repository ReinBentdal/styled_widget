import 'package:flutter/widgets.dart';
/*
Style methods specific for the [Text] widget should be applied here
*/

// Text styledText(String data) => Text(data);

extension StyledText on Text {
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

  // static Text text(String data) => Text(data);

  Text bold() => this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(fontWeight: FontWeight.bold));
 
  Text italic() => this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(fontStyle: FontStyle.italic));

  Text fontWeight(FontWeight fontWeight) => this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(fontWeight: fontWeight));

  Text fontSize(double size) => this.copyWith(style: (this.style ?? TextStyle(fontSize: size)));

  Text fontFamily(String font) => this.copyWith(style: (this.style ?? TextStyle(fontFamily: font)));

  Text letterSpacing(double space) => this.copyWith(style: (this.style ?? TextStyle(letterSpacing: space)));

  Text wordSpacing(double space) => this.copyWith(style: (this.style ?? TextStyle(wordSpacing: space)));

  Text textShadow({Color color = const Color(0x33000000),
      double blur = 0.0,
      Offset offset = Offset.zero}) => this.copyWith(style: (this.style ?? TextStyle(shadows: [Shadow(color: color, blurRadius: blur, offset: offset)])));

  Text textColor(Color color) =>
      this.copyWith(style: (this.style ?? TextStyle()).copyWith(color: color));

  Text textAlignment(TextAlign align) => this.copyWith(textAlign: align);

  Text textDirection(TextDirection direction) =>
      this.copyWith(textDirection: direction);
}
