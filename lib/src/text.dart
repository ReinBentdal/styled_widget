import 'package:flutter/widgets.dart';

typedef Widget TextWrapper(Text text);
typedef Widget TextWrapperWithContext(Text text, BuildContext context);

extension StyledText on Text {
  Text copyWith({
    String data,
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
        data ?? this.data,
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
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  Text italic() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      );

  Text fontWeight(FontWeight fontWeight) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      );

  Text fontSize(double size) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontSize: size,
        ),
      );

  Text fontFamily(String font) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontFamily: font,
        ),
      );

  Text letterSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          letterSpacing: space,
        ),
      );

  Text wordSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          wordSpacing: space,
        ),
      );

  Text textShadow({
    Color color = const Color(0x33000000),
    double blurRadius = 0.0,
    Offset offset = Offset.zero,
  }) =>
      this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          shadows: [
            Shadow(
              color: color,
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        ),
      );

  Text textColor(Color color) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          color: color,
        ),
      );

  Text textAlignment(TextAlign align) => this.copyWith(textAlign: align);

  Text textDirection(TextDirection direction) =>
      this.copyWith(textDirection: direction);

  Text textBaseline(TextBaseline textBaseline) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      );

  wrap(TextWrapper textWrapper) {
    if(textWrapper == null) {
      return this;
    }
    return textWrapper(this);
  }

  wrapWithContext(TextWrapperWithContext textWrapperWithContext, BuildContext context) {
    if(textWrapperWithContext == null) {
      return this;
    }
    return textWrapperWithContext(this, context);
  }
}