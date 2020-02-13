part of '../styled_widget.dart';

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
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      );

  Widget animateText(
          {@required Duration duration, Curve curve = Curves.linear}) =>
      duration != null
          ? _AnimatedText(
              data: this.data,
              duration: duration,
              curve: curve,
              locale: this.locale,
              maxLines: this.maxLines,
              overflow: this.overflow,
              semanticsLabel: this.semanticsLabel,
              softWrap: this.softWrap,
              strutStyle: this.strutStyle,
              style: this.style,
              textAlign: this.textAlign,
              textDirection: this.textDirection,
              textScaleFactor: this.textScaleFactor,
              textWidthBasis: this.textWidthBasis,
            )
          : this;

  Text textScale(double scaleFactor) =>
      this.copyWith(textScaleFactor: scaleFactor);

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
            ...this.style?.shadows,
          ],
        ),
      );

  Text textElevation(
    double elevation, {
    double angle = 0.0,
    Color color = const Color(0x33000000),
    double opacityRatio = 1.0,
    Duration duration,
    Curve curve = Curves.linear,
  }) {
    double calculatedOpacity = _elevationOpacityCurve(elevation) * opacityRatio;

    Shadow shadow = Shadow(
      color: color.withOpacity(calculatedOpacity),
      blurRadius: elevation,
      offset: Offset(sin(angle) * elevation, cos(angle) * elevation),
    );
    return this.copyWith(
      style: (this.style ?? TextStyle()).copyWith(
        shadows: [
          shadow,
          ...this.style?.shadows,
        ],
      ),
    );
  }

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

  Text textWidthBasis(TextWidthBasis textWidthBasis) =>
      this.copyWith(textWidthBasis: textWidthBasis);
}
