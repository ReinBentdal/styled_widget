part of 'text.dart';

class _AnimatedText extends ImplicitlyAnimatedWidget {
  /// Creates a container that animates its parameters implicitly.
  ///
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedText({
    Key key,
    this.data,
    this.locale,
    this.maxLines,
    this.overflow,
    this.semanticsLabel,
    this.softWrap,
    this.strutStyle,
    this.style,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.textWidthBasis,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  }) : super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  final String data;
  final TextStyle style;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final Locale locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  final String semanticsLabel;
  final TextWidthBasis textWidthBasis;

  @override
  _AnimatedTextState createState() => _AnimatedTextState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // TODO: denug variables
  }
}

class _AnimatedTextState extends AnimatedWidgetBaseState<_AnimatedText> {
  Tween<double> _textScaleFactor;
  Tween<double> _fontSize;
  Tween<double> _letterSpacing;
  Tween<double> _wordSpacing;
  Tween<double> _height;
  Tween<double> _decorationThickness;
  Tween<int> _maxLines; // TODO: animate maxLines?
  ColorTween _color;
  ColorTween _decorationColor;
  // TODO: animate background and foreground?

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _textScaleFactor = visitor(_textScaleFactor, widget.textScaleFactor,
        (dynamic value) => Tween<double>(begin: value));
    _fontSize = visitor(_fontSize, widget.style?.fontSize,
        (dynamic value) => Tween<double>(begin: value));
    _letterSpacing = visitor(_letterSpacing, widget.style?.letterSpacing,
        (dynamic value) => Tween<double>(begin: value));
    _wordSpacing = visitor(_wordSpacing, widget.style?.wordSpacing,
        (dynamic value) => Tween<double>(begin: value));
    _height = visitor(_height, widget.style?.height,
        (dynamic value) => Tween<double>(begin: value));
    _decorationThickness = visitor(_decorationThickness, widget.style?.decorationThickness,
        (dynamic value) => Tween<double>(begin: value));
    _maxLines = visitor(_maxLines, widget.maxLines,
        (dynamic value) => Tween<int>(begin: value));
    _color = visitor(_color, widget.style?.color,
        (dynamic value) => ColorTween(begin: value));
    _decorationColor = visitor(_decorationColor, widget.style?.decorationColor,
        (dynamic value) => ColorTween(begin: value));
  }

  @override
  Widget build(BuildContext context) => Text(
        widget.data,
        style: widget.style?.copyWith(
            fontSize: _fontSize?.evaluate(animation),
            letterSpacing: _letterSpacing?.evaluate(animation),
            wordSpacing: _wordSpacing?.evaluate(animation),
            height: _height?.evaluate(animation),
            decorationThickness: _decorationThickness?.evaluate(animation),
            color: _color?.evaluate(animation),
            decorationColor: _decorationColor?.evaluate(animation),
            ),
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        locale: widget.locale,
        softWrap: widget.softWrap,
        overflow: widget.overflow,
        textScaleFactor: _textScaleFactor?.evaluate(animation),
        maxLines: _maxLines?.evaluate(animation),
        semanticsLabel: widget.semanticsLabel,
        textWidthBasis: widget.textWidthBasis,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    // TODO: debug variables
  }
}
