part of '../styled_widget.dart';

extension StyledTextSpan on TextSpan {
  TextSpan copyWith({
    TextStyle style,
    GestureRecognizer recognizer,
    String semanticsLabel,
  }) =>
      TextSpan(
        text: this.text,
        children: this.children,
        style: style ?? this.style,
        recognizer: recognizer ?? this.recognizer,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      );

  TextSpan bold() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  TextSpan italic() => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontStyle: FontStyle.italic,
        ),
      );

  TextSpan fontWeight(FontWeight fontWeight) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontWeight: fontWeight,
        ),
      );

  TextSpan fontSize(double size) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontSize: size,
        ),
      );

  TextSpan fontFamily(String font) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          fontFamily: font,
        ),
      );

  TextSpan letterSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          letterSpacing: space,
        ),
      );

  TextSpan wordSpacing(double space) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          wordSpacing: space,
        ),
      );

  TextSpan textShadow({
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

  TextSpan textColor(Color color) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          color: color,
        ),
      );

  TextSpan textBaseline(TextBaseline textBaseline) => this.copyWith(
        style: (this.style ?? TextStyle()).copyWith(
          textBaseline: textBaseline,
        ),
      );
}
