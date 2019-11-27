import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AnimatedDecorationBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  AnimatedDecorationBox({
    Key key,
    this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  }) : assert(decoration == null || decoration.debugAssertIsValid()),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// The decoration to paint behind the [child].
  ///
  /// A shorthand for specifying just a solid color is available in the
  /// constructor: set the `color` argument instead of the `decoration`
  /// argument.
  final Decoration decoration;

  @override
  _AnimatedDecorationBoxState createState() => _AnimatedDecorationBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Decoration>('bg', decoration, defaultValue: null));
  }
}

class _AnimatedDecorationBoxState extends AnimatedWidgetBaseState<AnimatedDecorationBox> {
  DecorationTween _decoration;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(_decoration, widget.decoration, (dynamic value) => DecorationTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      child: widget.child,
      decoration: _decoration?.evaluate(animation),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<DecorationTween>('bg', _decoration, defaultValue: null));
  }
}

class AnimatedConstrainedBox extends ImplicitlyAnimatedWidget {
  /// The [curve] and [duration] arguments must not be null.
  AnimatedConstrainedBox({
    Key key,
    this.constraints,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    VoidCallback onEnd,
  }) : assert(constraints == null || constraints.debugAssertIsValid()),
       super(key: key, curve: curve, duration: duration, onEnd: onEnd);

  /// The [child] contained by the container.
  ///
  /// If null, and if the [constraints] are unbounded or also null, the
  /// container will expand to fill all available space in its parent, unless
  /// the parent provides unbounded constraints, in which case the container
  /// will attempt to be as small as possible.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  /// Additional constraints to apply to the child.
  ///
  /// The constructor `width` and `height` arguments are combined with the
  /// `constraints` argument to set this property.
  ///
  /// The [padding] goes inside the constraints.
  final BoxConstraints constraints;

  @override
  _AnimatedConstrainedBoxState createState() => _AnimatedConstrainedBoxState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BoxConstraints>('constraints', constraints, defaultValue: null, showName: false));
  }
}

class _AnimatedConstrainedBoxState extends AnimatedWidgetBaseState<AnimatedConstrainedBox> {
  BoxConstraintsTween _constraints;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _constraints = visitor(_constraints, widget.constraints, (dynamic value) => BoxConstraintsTween(begin: value));
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: widget.child,
      constraints: _constraints?.evaluate(animation),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<BoxConstraintsTween>('constraints', _constraints, showName: false, defaultValue: null));
  }
}