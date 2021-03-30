part of '../../styled_widget.dart';

typedef GestureOnTapChangeCallback = void Function(bool tapState);

extension StyledWidget on Widget {
  _StyledAnimatedModel _getAnimation(BuildContext context) {
    _StyledAnimatedModel? animation =
        _StyledInheritedAnimation.of(context)?.animation;
    assert(animation != null,
        '[styled_widget]: You can`t animate without defining the animation. Call the method animate() higher in your widget hierarchy to define an animation');
    return animation!;
  }

  /// animated all properties before this method
  Widget animate(
    Duration duration,
    Curve curve,
  ) =>
      _StyledInheritedAnimation(
        animation: _StyledAnimatedModel(duration: duration, curve: curve),
        child: this,
      );

  /// Applies a parent to a child
  /// ```dart
  /// final parentWidget = ({required Widget child}) => Styled.widget(child: child)
  ///   .alignment(Alignment.center)
  ///
  /// final childWidget = Text('some text')
  ///   .padding(all: 10)
  ///
  /// Widget build(BuildContext) => childWidget
  ///   .parent(parentWidget);
  /// ```
  Widget parent(Widget Function({required Widget child}) parent) =>
      parent(child: this);

  Widget padding({
    double? all,
    double? horizontal,
    double? vertical,
    double? top,
    double? bottom,
    double? left,
    double? right,
    bool animate = false,
  }) =>
      animate
          ? Builder(
              builder: (BuildContext context) {
                _StyledAnimatedModel animation = this._getAnimation(context);
                return AnimatedPadding(
                  child: this,
                  padding: EdgeInsets.only(
                    top: top ?? vertical ?? all ?? 0.0,
                    bottom: bottom ?? vertical ?? all ?? 0.0,
                    left: left ?? horizontal ?? all ?? 0.0,
                    right: right ?? horizontal ?? all ?? 0.0,
                  ),
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Padding(
              padding: EdgeInsets.only(
                top: top ?? vertical ?? all ?? 0.0,
                bottom: bottom ?? vertical ?? all ?? 0.0,
                left: left ?? horizontal ?? all ?? 0.0,
                right: right ?? horizontal ?? all ?? 0.0,
              ),
              child: this,
            );

  Widget opacity(
    double opacity, {
    bool animate = false,
    bool alwaysIncludeSemantics = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(builder: (animation) {
              return AnimatedOpacity(
                child: this,
                opacity: opacity,
                alwaysIncludeSemantics: alwaysIncludeSemantics,
                duration: animation.duration,
                curve: animation.curve,
              );
            })
          : Opacity(
              opacity: opacity,
              alwaysIncludeSemantics: alwaysIncludeSemantics,
              child: this,
            );

  Widget offstage({
    bool offstage = true,
  }) =>
      Offstage(
        key: key,
        offstage: offstage,
        child: this,
      );

  Widget alignment(
    AlignmentGeometry alignment, {
    bool animate = false,
  }) =>
      animate
          ? Builder(
              builder: (BuildContext context) {
                _StyledAnimatedModel animation = this._getAnimation(context);
                return AnimatedAlign(
                  child: this,
                  alignment: alignment,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Align(
              alignment: alignment,
              child: this,
            );

  Widget backgroundColor(Color color, {bool animate = false}) => animate
      ? _StyledAnimatedBuilder(
          builder: (animation) {
            return _AnimatedDecorationBox(
              child: this,
              decoration: BoxDecoration(color: color),
              duration: animation.duration,
              curve: animation.curve,
            );
          },
        )
      : DecoratedBox(
          child: this,
          decoration: BoxDecoration(color: color),
        );

  Widget backgroundImage(DecorationImage image, {bool animate = false}) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedDecorationBox(
                  child: this,
                  decoration: BoxDecoration(image: image),
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : DecoratedBox(
              child: this,
              decoration: BoxDecoration(image: image),
            );

  Widget backgroundGradient(Gradient gradient, {bool animate = false}) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedDecorationBox(
                  child: this,
                  decoration: BoxDecoration(gradient: gradient),
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : DecoratedBox(
              child: this,
              decoration: BoxDecoration(gradient: gradient),
            );

  Widget backgroundLinearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<Color>? colors,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform? transform,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget backgroundRadialGradient(
      {AlignmentGeometry center = Alignment.center,
      double radius = 0.5,
      List<Color>? colors,
      List<double>? stops,
      TileMode tileMode = TileMode.clamp,
      AlignmentGeometry? focal,
      double focalRadius = 0.0,
      GradientTransform? transform,
      bool animate = false}) {
    BoxDecoration decoration = BoxDecoration(
      gradient: RadialGradient(
        center: center,
        radius: radius,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget backgroundSweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      double endAngle = pi * 2,
      List<Color>? colors,
      List<double>? stops,
      TileMode tileMode = TileMode.clamp,
      GradientTransform? transform,
      bool animate = false}) {
    BoxDecoration decoration = BoxDecoration(
      gradient: SweepGradient(
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        colors: colors ?? [],
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget backgroundBlendMode(BlendMode blendMode, {bool animate = false}) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedDecorationBox(
                  child: this,
                  decoration: BoxDecoration(backgroundBlendMode: blendMode),
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : DecoratedBox(
              child: this,
              decoration: BoxDecoration(backgroundBlendMode: blendMode),
            );

  Widget backgroundBlur(
    double sigma, {
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedBackgroundBlur(
                  child: this,
                  sigma: sigma,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: this,
            );

  Widget borderRadius({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft ?? all ?? 0.0),
        topRight: Radius.circular(topRight ?? all ?? 0.0),
        bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
        bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget clipRRect({
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedClipRRect(
                  child: this,
                  clipper: clipper,
                  clipBehavior: clipBehavior,
                  topLeft: topLeft ?? all ?? 0.0,
                  topRight: topRight ?? all ?? 0.0,
                  bottomLeft: bottomLeft ?? all ?? 0.0,
                  bottomRight: bottomRight ?? all ?? 0.0,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : ClipRRect(
              child: this,
              clipper: clipper ?? null,
              clipBehavior: clipBehavior,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft ?? all ?? 0.0),
                topRight: Radius.circular(topRight ?? all ?? 0.0),
                bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
                bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
              ),
            );

  Widget clipRect({
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.hardEdge,
  }) =>
      ClipRect(
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget clipOval() => ClipOval(
        child: this,
      );

  Widget border({
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all ?? 0, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all ?? 0, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all ?? 0, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all ?? 0, style: style),
      ),
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget decorated({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
    DecorationPosition position = DecorationPosition.background,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      gradient: gradient,
      backgroundBlendMode: backgroundBlendMode,
      shape: shape,
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                position: position,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
            position: position,
          );
  }

  double _elevationOpacityCurve(double x) =>
      pow(x, 1 / 16) / sqrt(pow(x, 2) + 2) + 0.2;

  Widget elevation(double elevation,
          {BorderRadiusGeometry borderRadius = BorderRadius.zero,
          Color shadowColor = const Color(0xFF000000)}) =>
      Material(
        child: this,
        color: Colors.transparent,
        elevation: elevation,
        borderRadius: borderRadius,
        shadowColor: shadowColor,
      );

  Widget neumorphism({
    required double elevation,
    BorderRadius borderRadius = BorderRadius.zero,
    Color backgroundColor = const Color(0xffEDF1F5),
    double curve = 0.0,
    bool animate = false,
  }) {
    double offset = elevation / 2;
    int colorOffset = (40 * curve).toInt();
    final int Function(int, int) adjustColor = (int color, int colorOffset) {
      int colorVal = color + colorOffset;
      if (colorVal > 255)
        return 255;
      else if (colorVal < 0) return 0;
      return colorVal;
    };

    BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(
            adjustColor(backgroundColor.red, colorOffset),
            adjustColor(backgroundColor.green, colorOffset),
            adjustColor(backgroundColor.blue, colorOffset),
            1.0,
          ),
          Color.fromRGBO(
            adjustColor(backgroundColor.red, -colorOffset),
            adjustColor(backgroundColor.green, -colorOffset),
            adjustColor(backgroundColor.blue, -colorOffset),
            1.0,
          ),
        ],
        // stops: [0.90, 0.95],
      ),
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: elevation.abs(),
          offset: Offset(-offset, -offset),
        ),
        BoxShadow(
          color: Color(0xAAA3B1C6),
          blurRadius: elevation.abs(),
          offset: Offset(offset, offset),
        ),
      ],
    );

    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget boxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedDecorationBox(
                child: this,
                decoration: decoration,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : DecoratedBox(
            child: this,
            decoration: decoration,
          );
  }

  Widget constrained({
    double? width,
    double? height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
    bool animate = false,
  }) {
    BoxConstraints constraints = BoxConstraints(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
    constraints = (width != null || height != null)
        ? constraints.tighten(width: width, height: height)
        : constraints;
    return animate
        ? _StyledAnimatedBuilder(
            builder: (animation) {
              return _AnimatedConstrainedBox(
                child: this,
                constraints: constraints,
                duration: animation.duration,
                curve: animation.curve,
              );
            },
          )
        : ConstrainedBox(
            child: this,
            constraints: constraints,
          );
  }

  Widget width(double width, {bool animate = false}) => animate
      ? _StyledAnimatedBuilder(
          builder: (animation) {
            return _AnimatedConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(width: width),
              duration: animation.duration,
              curve: animation.curve,
            );
          },
        )
      : ConstrainedBox(
          child: this,
          constraints: BoxConstraints.tightFor(width: width),
        );

  Widget height(double height, {bool animate = false}) => animate
      ? _StyledAnimatedBuilder(
          builder: (animation) {
            return _AnimatedConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(height: height),
              duration: animation.duration,
              curve: animation.curve,
            );
          },
        )
      : ConstrainedBox(
          child: this,
          constraints: BoxConstraints.tightFor(height: height),
        );

  // TODO: FEATURE: ripple animation
  Widget ripple({
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    ShapeBorder? customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode? focusNode,
    bool canRequestFocus = true,
    bool autoFocus = false,
  }) =>
      Builder(
        builder: (BuildContext context) {
          // TODO: PERFORMANCE: findAncestorWidgetOfExactType vs InheritedWidget performance
          GestureDetector? gestures =
              context.findAncestorWidgetOfExactType<GestureDetector>();
          return Material(
            color: Colors.transparent,
            child: InkWell(
              focusColor: focusColor,
              hoverColor: hoverColor,
              highlightColor: highlightColor,
              splashColor: splashColor,
              splashFactory: splashFactory,
              radius: radius,
              customBorder: customBorder,
              enableFeedback: enableFeedback,
              excludeFromSemantics: excludeFromSemantics,
              focusNode: focusNode,
              canRequestFocus: canRequestFocus,
              autofocus: autoFocus,
              onTap: gestures?.onTap,
              child: this,
            ),
          );
        },
      );

  // TODO: RotatedBox
  Widget rotate({
    required double angle,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedTransform(
                  child: this,
                  transform: Matrix4.rotationZ(angle),
                  alignment: alignment,
                  origin: origin,
                  transformHitTests: transformHitTests,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Transform.rotate(
              child: this,
              angle: angle,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
            );

  Widget scale({
    double? all,
    double? x,
    double? y,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedTransform(
                  child: this,
                  transform: Matrix4.diagonal3Values(
                      x ?? all ?? 0, y ?? all ?? 0, 1.0),
                  alignment: alignment,
                  transformHitTests: transformHitTests,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Transform(
              transform:
                  Matrix4.diagonal3Values(x ?? all ?? 0, y ?? all ?? 0, 1.0),
              alignment: alignment,
              child: this,
              origin: origin,
              transformHitTests: transformHitTests,
            );

  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedTransform(
                  child: this,
                  transform:
                      Matrix4.translationValues(offset.dx, offset.dy, 0.0),
                  transformHitTests: transformHitTests,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Transform.translate(
              offset: offset,
              transformHitTests: transformHitTests,
              child: this,
            );

  Widget transform({
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedTransform(
                  child: this,
                  transform: transform,
                  origin: origin,
                  alignment: alignment,
                  transformHitTests: transformHitTests,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : Transform(
              transform: transform,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              child: this,
            );

  Widget overflow({
    AlignmentGeometry alignment = Alignment.center,
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(
              builder: (animation) {
                return _AnimatedOverflowBox(
                  child: this,
                  alignment: alignment,
                  minWidth: minWidth,
                  maxWidth: minWidth,
                  minHeight: minHeight,
                  maxHeight: maxHeight,
                  duration: animation.duration,
                  curve: animation.curve,
                );
              },
            )
          : OverflowBox(
              alignment: alignment,
              minWidth: minWidth,
              maxWidth: minWidth,
              minHeight: minHeight,
              maxHeight: maxHeight,
              child: this,
            );

  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      SingleChildScrollView(
        child: this,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
      );

  Widget expanded({
    int flex = 1,
  }) =>
      Expanded(
        child: this,
        flex: flex,
      );

  Widget flexible({
    int flex = 1,
    FlexFit fit = FlexFit.loose,
  }) =>
      Flexible(
        child: this,
        flex: flex,
        fit: fit,
      );

  Widget positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBuilder(builder: (animation) {
              return AnimatedPositioned(
                child: this,
                duration: animation.duration,
                curve: animation.curve,
                left: left,
                top: top,
                right: right,
                bottom: bottom,
                width: width,
                height: height,
              );
            })
          : Positioned(
              child: this,
              left: left,
              top: top,
              right: right,
              bottom: bottom,
              width: width,
              height: height,
            );

  Widget semanticsLabel(String label) => Semantics.fromProperties(
        properties: SemanticsProperties(label: label),
        child: this,
      );

  Widget gestures({
    GestureOnTapChangeCallback? onTapChange,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    HitTestBehavior? behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: () {
          if (onTap != null) onTap();
          if (onTapChange != null) onTapChange(false);
        },
        onTapUp: onTapUp,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onLongPressStart: onLongPressStart,
        onLongPressEnd: onLongPressEnd,
        onLongPressMoveUpdate: onLongPressMoveUpdate,
        onLongPressUp: onLongPressUp,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragEnd: onVerticalDragEnd,
        onVerticalDragDown: onVerticalDragDown,
        onVerticalDragCancel: onVerticalDragCancel,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onHorizontalDragStart: onHorizontalDragStart,
        onHorizontalDragEnd: onHorizontalDragEnd,
        onHorizontalDragCancel: onHorizontalDragCancel,
        onHorizontalDragUpdate: onHorizontalDragUpdate,
        onHorizontalDragDown: onHorizontalDragDown,
        onForcePressStart: onForcePressStart,
        onForcePressEnd: onForcePressEnd,
        onForcePressPeak: onForcePressPeak,
        onForcePressUpdate: onForcePressUpdate,
        onPanStart: onPanStart,
        onPanEnd: onPanEnd,
        onPanCancel: onPanCancel,
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onScaleStart: onScaleStart,
        onScaleEnd: onScaleEnd,
        onScaleUpdate: onScaleUpdate,
        behavior: behavior,
        excludeFromSemantics: excludeFromSemantics,
        dragStartBehavior: dragStartBehavior,
        child: this,
      );

  // TODO: FEATURE: animate aspectRatio widget
  Widget aspectRatio({
    required double aspectRatio,
  }) =>
      AspectRatio(
        aspectRatio: aspectRatio,
        child: this,
      );

  // TODO: FEATURE: animate center widget
  Widget center({
    double? widthFactor,
    double? heightFactor,
  }) =>
      Center(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  // TODO: FEATURE: animate fittedBox
  Widget fittedBox({
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
  }) =>
      FittedBox(
        fit: fit,
        alignment: alignment,
        child: this,
      );

  // TODO: FEATURE: animate FractionallySizedBox
  Widget fractionallySizedBox({
    AlignmentGeometry alignment = Alignment.center,
    double? widthFactor,
    double? heightFactor,
  }) =>
      FractionallySizedBox(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  // TODO: FEATURE: animate card
  Widget card({
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
  }) =>
      Card(
        color: color,
        elevation: elevation,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: this,
      );
}
