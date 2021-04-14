part of '../styled_widget.dart';

class _StyledAnimatedModel {
  final Duration duration;
  final Curve curve;
  _StyledAnimatedModel({
    required this.duration,
    this.curve = Curves.linear,
  });
}

class _StyledInheritedAnimation extends InheritedWidget {
  final _StyledAnimatedModel? animation;

  _StyledInheritedAnimation({this.animation, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(_StyledInheritedAnimation oldAnimation) =>
      !(oldAnimation.animation?.duration == animation?.duration &&
          oldAnimation.animation?.curve == animation?.curve);

  static _StyledInheritedAnimation? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_StyledInheritedAnimation>();
}

class _StyledAnimatedBuilder extends StatelessWidget {
  _StyledAnimatedBuilder({required this.builder});

  final Widget Function(_StyledAnimatedModel) builder;

  @override
  Widget build(BuildContext context) {
    _StyledAnimatedModel? animation =
        _StyledInheritedAnimation.of(context)?.animation;
    assert(
      animation != null,
      '[styled_widget]: Tried to animate a widget without an animation specified. Define your animation using .animate() as an ancestor of the widget you are trying to animate',
    );
    return builder(animation!);
  }
}

class _AnimatedDecorationBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedDecorationBox({
    Key? key,
    this.decoration,
    this.position = DecorationPosition.background,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  })  : assert(decoration == null || decoration.debugAssertIsValid()),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// The decoration to paint behind the [child].
  ///
  /// A shorthand for specifying just a solid color is available in the
  /// constructor: set the `color` argument instead of the `decoration`
  /// argument.
  final Decoration? decoration;

  final DecorationPosition? position;

  @override
  _AnimatedDecorationBoxState createState() => _AnimatedDecorationBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<Decoration>('bg', decoration, defaultValue: null));
    // TODO: debug [position]?
  }
}

class _AnimatedDecorationBoxState
    extends AnimatedWidgetBaseState<_AnimatedDecorationBox> {
  DecorationTween? _decoration;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(_decoration, widget.decoration,
            (dynamic value) => DecorationTween(begin: value as Decoration))
        as DecorationTween;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: widget.child,
      decoration: _decoration?.evaluate(animation) ?? BoxDecoration(),
      position: widget.position ?? DecorationPosition.background,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<DecorationTween>('bg', _decoration,
        defaultValue: null));
  }
}

class _AnimatedConstrainedBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedConstrainedBox({
    Key? key,
    this.constraints,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  })  : assert(constraints == null || constraints.debugAssertIsValid()),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  final BoxConstraints? constraints;

  @override
  _AnimatedConstrainedBoxState createState() => _AnimatedConstrainedBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>(
        'constraints', constraints,
        defaultValue: null, showName: false));
  }
}

class _AnimatedConstrainedBoxState
    extends AnimatedWidgetBaseState<_AnimatedConstrainedBox> {
  BoxConstraintsTween? _constraints;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _constraints = visitor(
            _constraints,
            widget.constraints,
            (dynamic value) =>
                BoxConstraintsTween(begin: value as BoxConstraints))
        as BoxConstraintsTween;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: widget.child,
      constraints: _constraints?.evaluate(animation) ?? BoxConstraints(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<BoxConstraintsTween>(
        'constraints', _constraints,
        showName: false, defaultValue: null));
  }
}

class _AnimatedTransform extends ImplicitlyAnimatedWidget {
  /// Creates a container that animates its parameters implicitly.
  ///
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedTransform({
    Key? key,
    this.transform,
    this.origin,
    this.alignment,
    this.transformHitTests = true,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  final Offset? origin;

  final AlignmentGeometry? alignment;

  final bool? transformHitTests;

  /// The transformation matrix to apply before painting the container.
  final Matrix4? transform;

  @override
  _AnimatedTransformState createState() => _AnimatedTransformState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        showName: false, defaultValue: null));
    properties.add(ObjectFlagProperty<Matrix4>.has('transform', transform));
    // TODO: debug [origin], [transformHitTest]?
  }
}

class _AnimatedTransformState
    extends AnimatedWidgetBaseState<_AnimatedTransform> {
  AlignmentGeometryTween? _alignment;
  Matrix4Tween? _transform;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _alignment = visitor(
            _alignment,
            widget.alignment,
            (dynamic value) =>
                AlignmentGeometryTween(begin: value as AlignmentGeometry))
        as AlignmentGeometryTween;
    _transform = visitor(_transform, widget.transform,
            (dynamic value) => Matrix4Tween(begin: value as Matrix4))
        as Matrix4Tween;
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      child: widget.child,
      transform: _transform?.evaluate(animation) ?? Matrix4.zero(),
      alignment: _alignment?.evaluate(animation),
      origin: widget.origin,
      transformHitTests: widget.transformHitTests ?? true,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<AlignmentGeometryTween>(
        'alignment', _alignment,
        showName: false, defaultValue: null));
    description
        .add(ObjectFlagProperty<Matrix4Tween>.has('transform', _transform));
  }
}

class _AnimatedClipRRect extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  _AnimatedClipRRect({
    Key? key,
    this.topLeft,
    this.topRight,
    this.bottomLeft,
    this.bottomRight,
    this.clipper,
    this.clipBehavior,
    this.child,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  final double? topLeft;
  final double? topRight;
  final double? bottomLeft;
  final double? bottomRight;
  final CustomClipper<RRect>? clipper;
  final Clip? clipBehavior;

  @override
  _AnimatedClipRRectState createState() => _AnimatedClipRRectState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    //TODO: debug [topLeft], [topRight], [bottomLeft], [bottomRight]
  }
}

class _AnimatedClipRRectState
    extends AnimatedWidgetBaseState<_AnimatedClipRRect> {
  Tween<double>? _topLeft;
  Tween<double>? _topRight;
  Tween<double>? _bottomLeft;
  Tween<double>? _bottomRight;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _topLeft = visitor(_topLeft, widget.topLeft,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _topRight = visitor(_topRight, widget.topRight,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _bottomLeft = visitor(_bottomLeft, widget.bottomLeft,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _bottomRight = visitor(_bottomRight, widget.bottomRight,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: widget.child,
      clipper: widget.clipper,
      clipBehavior: widget.clipBehavior ?? Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: _topLeft != null
            ? Radius.circular(_topLeft!.evaluate(animation))
            : Radius.zero,
        topRight: _topRight != null
            ? Radius.circular(_topRight!.evaluate(animation))
            : Radius.zero,
        bottomLeft: _bottomLeft != null
            ? Radius.circular(_bottomLeft!.evaluate(animation))
            : Radius.zero,
        bottomRight: _bottomRight != null
            ? Radius.circular(_bottomRight!.evaluate(animation))
            : Radius.zero,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    //TODO: debug [_topLeft], [_topRight], [_bottomLeft], [_bottomRight]
  }
}

class _AnimatedBackgroundBlur extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates its opacity implicitly.
  ///
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0,
  /// inclusive. The [curve] and [duration] arguments must not be null.
  const _AnimatedBackgroundBlur({
    Key? key,
    this.child,
    required this.sigma,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  })  : assert(sigma >= 0.0),
        super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;

  final double sigma;

  @override
  _AnimatedBackgroundBlurState createState() => _AnimatedBackgroundBlurState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('background blur', sigma));
  }
}

class _AnimatedBackgroundBlurState
    extends ImplicitlyAnimatedWidgetState<_AnimatedBackgroundBlur> {
  Tween<double>? _sigma;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _sigma = visitor(_sigma, widget.opacity,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: _sigma?.evaluate(animation) ?? 0,
        sigmaY: _sigma?.evaluate(animation) ?? 0,
      ),
      child: widget.child,
    );
  }
}

class _AnimatedOverflowBox extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates its opacity implicitly.
  ///
  /// The [opacity] argument must not be null and must be between 0.0 and 1.0,
  /// inclusive. The [curve] and [duration] arguments must not be null.
  const _AnimatedOverflowBox({
    Key? key,
    this.child,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.alignment,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget? child;
  final AlignmentGeometry? alignment;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  @override
  _AnimatedOverflowBoxState createState() => _AnimatedOverflowBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // TODO: debug
  }
}

class _AnimatedOverflowBoxState
    extends ImplicitlyAnimatedWidgetState<_AnimatedOverflowBox> {
  Tween<double>? _minWidth;
  Tween<double>? _maxWidth;
  Tween<double>? _minHeight;
  Tween<double>? _maxHeight;
  AlignmentGeometryTween? _alignment;
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _minWidth = visitor(_minWidth, widget.minWidth,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _maxWidth = visitor(_maxWidth, widget.maxWidth,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _minHeight = visitor(_minHeight, widget.minHeight,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _maxHeight = visitor(_maxHeight, widget.maxHeight,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>;
    _alignment = visitor(
            _alignment,
            widget.alignment,
            (dynamic value) =>
                AlignmentGeometryTween(begin: value as AlignmentGeometry))
        as AlignmentGeometryTween;
  }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: _minWidth?.evaluate(animation),
      maxWidth: _maxWidth?.evaluate(animation),
      minHeight: _minHeight?.evaluate(animation),
      maxHeight: _maxHeight?.evaluate(animation),
      alignment: _alignment?.evaluate(animation) ?? Alignment.center,
      child: widget.child,
    );
  }
}
