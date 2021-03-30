part of '../styled_widget.dart';

class Styled {
  static Widget widget({Widget? child}) =>
      child ??
      LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      );

  static Text text(
    String data, {
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
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedTextContainer(
              data,
              locale: locale,
              maxLines: maxLines,
              overflow: overflow,
              semanticsLabel: semanticsLabel,
              softWrap: softWrap,
              strutStyle: strutStyle,
              style: style,
              textAlign: textAlign,
              textDirection: textDirection,
              textScaleFactor: textScaleFactor,
              textWidthBasis: textWidthBasis,
            )
          : Text(
              data,
              locale: locale,
              maxLines: maxLines,
              overflow: overflow,
              semanticsLabel: semanticsLabel,
              softWrap: softWrap,
              strutStyle: strutStyle,
              style: style,
              textAlign: textAlign,
              textDirection: textDirection,
              textScaleFactor: textScaleFactor,
              textWidthBasis: textWidthBasis,
            );

  static Icon icon(
    IconData icon, {
    Key? key,
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedIconContainer(
              icon,
              color: color,
              size: size,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
            )
          : Icon(
              icon,
              color: color,
              size: size,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
            );
}
