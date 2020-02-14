part of '../styled_widget.dart';

typedef GestureOnTapChangeCallback = void Function(bool tapState);

extension Styled on Widget {
  static Widget widget({Widget child}) =>
      child ??
      LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      );

  Widget _tryMergeConstraints({BoxConstraints constraints}) {
    // only merge if the duration and curve is the exact same
    if (this is ConstrainedBox) {
      return ConstrainedBox(
        child: (this as ConstrainedBox)?.child,
        constraints: (this as ConstrainedBox)?.constraints?.copyWith(
              minWidth: constraints?.minWidth,
              maxWidth: constraints?.maxWidth,
              minHeight: constraints?.minHeight,
              maxHeight: constraints?.maxHeight,
            ),
      );
    }
    return ConstrainedBox(
      constraints: constraints,
      child: this,
    );
  }

  Widget _tryMergeAnimatedConstraints({BoxConstraints constraints}) {
    if (this is _StyledAnimatedConstrainedBoxContainer) {
      return _StyledAnimatedConstrainedBoxContainer(
        child: (this as _StyledAnimatedConstrainedBoxContainer)?.child,
        constraints: (this as _StyledAnimatedConstrainedBoxContainer)
            ?.constraints
            ?.copyWith(
              minWidth: constraints?.minWidth,
              maxWidth: constraints?.maxWidth,
              minHeight: constraints?.minHeight,
              maxHeight: constraints?.maxHeight,
            ),
      );
    }
    return _StyledAnimatedConstrainedBoxContainer(
      constraints: constraints,
      child: this,
    );
  }

  Widget _tryMergeDecoration({
    BoxDecoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    // merge decoration with child
    if (this is DecoratedBox && (this as DecoratedBox)?.position == position) {
      DecoratedBox child = this as DecoratedBox;
      return DecoratedBox(
        child: child.child,
        position: position,
        decoration: (child.decoration as BoxDecoration)?.copyWith(
          color: decoration?.color,
          backgroundBlendMode: decoration?.backgroundBlendMode,
          border: decoration?.border,
          borderRadius: decoration?.borderRadius,
          // TODO: remove child shadow?
          boxShadow: [
            ...decoration?.boxShadow,
            ...(child.decoration as BoxDecoration)?.boxShadow,
          ],
          gradient: decoration?.gradient,
          image: decoration?.image,
          shape: decoration?.shape,
        ),
      );
    }
    return DecoratedBox(
      decoration: decoration,
      position: position,
      child: this,
    );
  }

  Widget _tryMergeAnimatedDecoration({
    BoxDecoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) {
    if (this is _StyledAnimatedDecorationBoxContainer &&
        (this as _StyledAnimatedDecorationBoxContainer)?.position == position) {
      _StyledAnimatedDecorationBoxContainer child =
          this as _StyledAnimatedDecorationBoxContainer;
      return _StyledAnimatedDecorationBoxContainer(
        child: child.child,
        position: position,
        decoration: child.decoration?.copyWith(
          color: decoration?.color,
          backgroundBlendMode: decoration?.backgroundBlendMode,
          border: decoration?.border,
          borderRadius: decoration?.borderRadius,
          // TODO: remove child shadow?
          boxShadow: [
            ...decoration?.boxShadow,
            ...child.decoration?.boxShadow,
          ],
          gradient: decoration?.gradient,
          image: decoration?.image,
          shape: decoration?.shape,
        ),
      );
    }
    return _StyledAnimatedDecorationBoxContainer(
      child: this,
      decoration: decoration,
      position: position,
    );
  }

  /// animated all properties before this method
  Widget animate({
    @required Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _StyledAnimated(
        animation: _StyledAnimatedModel(duration: duration, curve: curve),
        child: this,
      );

  Widget padding({
    double all,
    double horizontal,
    double vertical,
    double top,
    double bottom,
    double left,
    double right,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedPaddingContainer(
              padding: EdgeInsets.only(
                top: top ?? vertical ?? all ?? 0.0,
                bottom: bottom ?? vertical ?? all ?? 0.0,
                left: left ?? horizontal ?? all ?? 0.0,
                right: right ?? horizontal ?? all ?? 0.0,
              ),
              child: this,
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
  }) =>
      animate
          ? _StyledAnimatedOpacityContainer(
              opacity: opacity,
              child: this,
            )
          : Opacity(
              opacity: opacity,
              child: this,
            );

  Widget alignment(
    AlignmentGeometry alignment, {
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedAlignContainer(
              alignment: alignment,
              child: this,
            )
          : Align(
              alignment: alignment,
              child: this,
            );

  Widget backgroundColor(Color color, {bool animate = false}) => animate
      ? _tryMergeAnimatedDecoration(decoration: BoxDecoration(color: color))
      : _tryMergeDecoration(decoration: BoxDecoration(color: color));

  Widget backgroundImage(DecorationImage image, {bool animate = false}) =>
      animate
          ? _tryMergeAnimatedDecoration(decoration: BoxDecoration(image: image))
          : _tryMergeDecoration(decoration: BoxDecoration(image: image));

  Widget backgroundGradient(Gradient gradient, {bool animate = false}) =>
      animate
          ? _tryMergeAnimatedDecoration(
              decoration: BoxDecoration(gradient: gradient))
          : _tryMergeDecoration(decoration: BoxDecoration(gradient: gradient));

  Widget backgroundLinearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<Color> colors,
    List<double> stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform transform,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _tryMergeAnimatedDecoration(decoration: decoration)
        : _tryMergeDecoration(decoration: decoration);
  }

  Widget backgroundRadialGradient(
      {AlignmentGeometry center = Alignment.center,
      double radius = 0.5,
      List<Color> colors,
      List<double> stops,
      TileMode tileMode = TileMode.clamp,
      AlignmentGeometry focal,
      double focalRadius = 0.0,
      GradientTransform transform,
      bool animate = false}) {
    BoxDecoration decoration = BoxDecoration(
      gradient: RadialGradient(
        center: center,
        radius: radius,
        colors: colors,
        stops: stops,
        tileMode: tileMode,
        focal: focal,
        focalRadius: focalRadius,
        transform: transform,
      ),
    );
    return animate
        ? _tryMergeAnimatedDecoration(decoration: decoration)
        : _tryMergeDecoration(decoration: decoration);
  }

  Widget backgroundSweepGradient(
      {AlignmentGeometry center = Alignment.center,
      double startAngle = 0.0,
      double endAngle = pi * 2,
      List<Color> colors,
      List<double> stops,
      TileMode tileMode = TileMode.clamp,
      GradientTransform transform,
      bool animate = false}) {
    BoxDecoration decoration = BoxDecoration(
      gradient: SweepGradient(
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
        colors: colors,
        stops: stops,
        tileMode: tileMode,
        transform: transform,
      ),
    );
    return animate
        ? _tryMergeAnimatedDecoration(decoration: decoration)
        : _tryMergeDecoration(decoration: decoration);
  }

  Widget backgroundBlendMode(BlendMode blendMode, {bool animate = false}) =>
      animate
          ? _tryMergeAnimatedDecoration(
              decoration: BoxDecoration(backgroundBlendMode: blendMode),
            )
          : _tryMergeDecoration(
              decoration: BoxDecoration(backgroundBlendMode: blendMode),
            );

  Widget backgroundBlur(
    double sigma, {
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBackgroundBlurContainer(
              sigma: sigma,
              child: this,
            )
          : BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigma,
                sigmaY: sigma,
              ),
              child: this,
            );

  Widget borderRadius({
    double all,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedBorderRadiusContainer(
              child: this,
              topLeft: topLeft ?? all ?? 0.0,
              topRight: topRight ?? all ?? 0.0,
              bottomLeft: bottomLeft ?? all ?? 0.0,
              bottomRight: bottomRight ?? all ?? 0.0,
            )
          : ClipRRect(
              child: this,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft ?? all ?? 0.0),
                topRight: Radius.circular(topRight ?? all ?? 0.0),
                bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
                bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
              ),
            );

  Widget clipOval() => ClipOval(
        child: this,
      );

  Widget border({
    double all,
    double left,
    double right,
    double top,
    double bottom,
    Color color = const Color(0xFF000000),
    BorderStyle style = BorderStyle.solid,
    bool animate = false,
  }) {
    BoxDecoration decoration = BoxDecoration(
      border: Border(
        left: (left ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: left ?? all, style: style),
        right: (right ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: right ?? all, style: style),
        top: (top ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: top ?? all, style: style),
        bottom: (bottom ?? all) == null
            ? BorderSide.none
            : BorderSide(color: color, width: bottom ?? all, style: style),
      ),
    );
    return animate
        ? _tryMergeAnimatedDecoration(decoration: decoration)
        : _tryMergeDecoration(decoration: decoration);
  }

  Widget decoration({
    Color color,
    DecorationImage image,
    BoxBorder border,
    BorderRadius borderRadius,
    List<BoxShadow> boxShadow,
    Gradient gradient,
    BlendMode backgroundBlendMode,
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
        ? _tryMergeAnimatedDecoration(
            decoration: decoration,
            position: position,
          )
        : _tryMergeDecoration(
            decoration: decoration,
            position: position,
          );
  }

  double _elevationOpacityCurve(x) => pow(x, 1 / 16) / sqrt(pow(x, 2) + 2);

  Widget elevation(
    double elevation, {
    Color shadowColor = const Color(0xFF000000),
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedElevationContainer(
              child: this,
              elevation: elevation,
              shadowColor: shadowColor,
            )
          : PhysicalShape(
              clipper:
                  const ShapeBorderClipper(shape: RoundedRectangleBorder()),
              color: Colors.transparent,
              elevation: elevation,
              shadowColor: shadowColor,
              child: this,
            );

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
        ? _tryMergeAnimatedDecoration(decoration: decoration)
        : _tryMergeDecoration(decoration: decoration);
  }

  Widget constraints({
    double width,
    double height,
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
        ? constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height)
        : constraints;
    return animate
        ? _tryMergeAnimatedConstraints(constraints: constraints)
        : _tryMergeConstraints(constraints: constraints);
  }

  Widget width(double width, {bool animate = false}) => animate
      ? _tryMergeAnimatedConstraints(
          constraints: BoxConstraints(
            minWidth: width,
            maxWidth: width,
          ),
        )
      : _tryMergeConstraints(
          constraints: BoxConstraints(
            minWidth: width,
            maxWidth: width,
          ),
        );

  Widget height(double height, {bool animate = false}) => animate
      ? _tryMergeAnimatedConstraints(
          constraints: BoxConstraints(
            minHeight: height,
            maxHeight: height,
          ),
        )
      : _tryMergeConstraints(
          constraints: BoxConstraints(
            minHeight: height,
            maxHeight: height,
          ),
        );

  Widget ripple({
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    InteractiveInkFeatureFactory splashFactory,
    double radius,
    ShapeBorder customBorder,
    bool enableFeedback = true,
    bool excludeFromSemantics = false,
    FocusNode focusNode,
    bool canRequestFocus = true,
    bool autoFocus = false,
  }) =>
      Material(
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
          onTap: () {},
          child: this,
        ),
      );

  // TODO: RotatedBox
  Widget rotate({
    @required double angle,
    Offset origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedTransformContainer(
              child: this,
              transform: Matrix4.rotationZ(angle),
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
            )
          : Transform.rotate(
              angle: angle,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              child: this,
            );

  Widget scale(
    double scale, {
    Offset origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedTransformContainer(
              child: this,
              transform: Matrix4.diagonal3Values(scale, scale, 1.0),
              alignment: alignment,
              transformHitTests: transformHitTests,
            )
          : Transform.scale(
              scale: scale,
              alignment: alignment,
              child: this,
              origin: origin,
              transformHitTests: transformHitTests,
            );

  Widget translate({
    @required Offset offset,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedTransformContainer(
              child: this,
              transform: Matrix4.translationValues(offset.dx, offset.dy, 0.0),
              transformHitTests: transformHitTests,
            )
          : Transform.translate(
              offset: offset,
              transformHitTests: transformHitTests,
              child: this,
            );

  Widget transform({
    @required Matrix4 transform,
    Offset origin,
    AlignmentGeometry alignment,
    bool transformHitTests = true,
    bool animate = false,
  }) =>
      animate
          ? _StyledAnimatedTransformContainer(
              child: this,
              transform: transform,
              origin: origin,
              alignment: alignment,
              transformHitTests: transformHitTests,
            )
          : Transform(
              transform: transform,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              child: this,
            );

  Widget overflow() => OverflowBox();

  Widget scrollable(
          {Axis scrollDirection = Axis.vertical,
          bool reverse = false,
          bool primary,
          ScrollPhysics physics,
          ScrollController controller,
          DragStartBehavior dragStartBehavior = DragStartBehavior.start}) =>
      SingleChildScrollView(
        child: this,
        scrollDirection: scrollDirection,
        reverse: reverse,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
      );

  Widget semanticsLabel(String label) => Semantics.fromProperties(
        properties: SemanticsProperties(label: label),
        child: this,
      );

  Widget gestures({
    GestureOnTapChangeCallback onTapChange,
    GestureTapDownCallback onTapDown,
    GestureTapUpCallback onTapUp,
    GestureTapCallback onTap,
    GestureTapCancelCallback onTapCancel,
    GestureTapDownCallback onSecondaryTapDown,
    GestureTapUpCallback onSecondaryTapUp,
    GestureTapCancelCallback onSecondaryTapCancel,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureLongPressStartCallback onLongPressStart,
    GestureLongPressMoveUpdateCallback onLongPressMoveUpdate,
    GestureLongPressUpCallback onLongPressUp,
    GestureLongPressEndCallback onLongPressEnd,
    GestureDragDownCallback onVerticalDragDown,
    GestureDragStartCallback onVerticalDragStart,
    GestureDragUpdateCallback onVerticalDragUpdate,
    GestureDragEndCallback onVerticalDragEnd,
    GestureDragCancelCallback onVerticalDragCancel,
    GestureDragDownCallback onHorizontalDragDown,
    GestureDragStartCallback onHorizontalDragStart,
    GestureDragUpdateCallback onHorizontalDragUpdate,
    GestureDragEndCallback onHorizontalDragEnd,
    GestureDragCancelCallback onHorizontalDragCancel,
    GestureDragDownCallback onPanDown,
    GestureDragStartCallback onPanStart,
    GestureDragUpdateCallback onPanUpdate,
    GestureDragEndCallback onPanEnd,
    GestureDragCancelCallback onPanCancel,
    GestureScaleStartCallback onScaleStart,
    GestureScaleUpdateCallback onScaleUpdate,
    GestureScaleEndCallback onScaleEnd,
    GestureForcePressStartCallback onForcePressStart,
    GestureForcePressPeakCallback onForcePressPeak,
    GestureForcePressUpdateCallback onForcePressUpdate,
    GestureForcePressEndCallback onForcePressEnd,
    HitTestBehavior behavior,
    bool excludeFromSemantics = false,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
  }) =>
      GestureDetector(
        onTapDown: (TapDownDetails tapDownDetails) {
          if (onTapDown != null) onTapDown(tapDownDetails);
          if (onTapChange != null) onTapChange(true);
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          if (onTapUp != null) onTapUp(tapUpDetails);
          if (onTapChange != null) onTapChange(false);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (onTapChange != null) onTapChange(false);
        },
        onTap: onTap,
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
}
