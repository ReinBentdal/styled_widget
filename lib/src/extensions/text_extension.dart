part of '../../styled_widget.dart';

extension StyledText<T extends Text> on T {
  T copyWith({
    String? data,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
  }) =>
      (this is _StyledAnimatedTextContainer
          ? _StyledAnimatedTextContainer(
              data ?? this.data ?? "",
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
            )
          : Text(
              data ?? this.data ?? "",
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
            )) as T;

  T textStyle(TextStyle style) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          background: style.background,
          backgroundColor: style.backgroundColor,
          color: style.color,
          debugLabel: style.debugLabel,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          fontFamily: style.fontFamily,
          fontFamilyFallback: style.fontFamilyFallback,
          fontFeatures: style.fontFeatures,
          fontSize: style.fontSize,
          fontStyle: style.fontStyle,
          fontWeight: style.fontWeight,
          foreground: style.foreground,
          height: style.height,
          inherit: style.inherit,
          letterSpacing: style.letterSpacing,
          locale: style.locale,
          shadows: style.shadows,
          textBaseline: style.textBaseline,
          wordSpacing: style.wordSpacing,
        ),
      );

  T textScale(double scaleFactor) =>
      this.copyWith(textScaleFactor: scaleFactor);

  T bold() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  T italic() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      );

  T fontWeight(FontWeight fontWeight) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      );

  T fontSize(double size) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontSize: size,
        ),
      );

  T fontFamily(String font) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontFamily: font,
        ),
      );

  T letterSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          letterSpacing: space,
        ),
      );

  T wordSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          wordSpacing: space,
        ),
      );

  T textShadow({
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

  T textElevation(
    double elevation, {
    double angle = 0.0,
    Color color = const Color(0x33000000),
    double opacityRatio = 1.0,
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
        ],
      ),
    );
  }

  T textColor(Color color) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          color: color,
        ),
      );

  T textAlignment(TextAlign align) => this.copyWith(textAlign: align);

  T textDirection(TextDirection direction) =>
      this.copyWith(textDirection: direction);

  T textBaseline(TextBaseline textBaseline) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      );

  T textWidthBasis(TextWidthBasis textWidthBasis) =>
      this.copyWith(textWidthBasis: textWidthBasis);
}
