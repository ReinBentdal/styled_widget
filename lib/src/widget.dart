import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'animated.dart';

typedef GestureIsTapCallback = void Function(bool isTapped);

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

  Widget _tryMergeConstraints({
    BoxConstraints constraints,
    Duration duration,
    Curve curve,
  }) {
    dynamic child = this;

    // only merge if the duration and curve is the exact same
    if ((child is ConstrainedBox && duration == null) ||
        (child is AnimatedConstrainedBox &&
            duration == child.duration &&
            curve == child.curve)) {
      BoxConstraints childConstraints = child.constraints;
      constraints = childConstraints?.copyWith(
        minWidth: constraints?.minWidth,
        maxWidth: constraints?.maxWidth,
        minHeight: constraints?.minHeight,
        maxHeight: constraints?.maxHeight,
      );
    }

    return duration == null
        ? ConstrainedBox(
            constraints: constraints,
            child: child,
          )
        : AnimatedConstrainedBox(
            constraints: constraints,
            child: child,
            duration: duration,
            curve: curve,
          );
  }

  Widget _tryMergeDecoration({
    BoxDecoration decoration,
    Duration duration,
    Curve curve,
    DecorationPosition position,
  }) {
    dynamic child = this;

    // only merge if the duration and curve is the exact same
    if ((child is DecoratedBox && duration == null) ||
        (child is AnimatedDecorationBox &&
            duration == child.duration &&
            curve == child.curve)) {
      BoxDecoration childDecoration = child.decoration;
      position ??= child.position;
      decoration = childDecoration?.copyWith(
        color: decoration?.color,
        backgroundBlendMode: decoration?.backgroundBlendMode,
        border: decoration?.border,
        borderRadius: decoration?.borderRadius,
        boxShadow: decoration?.boxShadow,
        gradient: decoration?.gradient,
        image: decoration?.image,
        shape: decoration?.shape,
      );
      child = child.child;
    }

    return duration == null
        ? DecoratedBox(
            decoration: decoration,
            position: position ?? DecorationPosition.background,
            child: child,
          )
        : AnimatedDecorationBox(
            child: child,
            decoration: decoration,
            position: position ?? DecorationPosition.background,
            duration: duration,
            curve: curve,
          );
  }

  Widget padding({
    double all,
    double horizontal,
    double vertical,
    double top,
    double bottom,
    double left,
    double right,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Padding(
              padding: EdgeInsets.only(
                top: top ?? vertical ?? all ?? 0.0,
                bottom: bottom ?? vertical ?? all ?? 0.0,
                left: left ?? horizontal ?? all ?? 0.0,
                right: right ?? horizontal ?? all ?? 0.0,
              ),
              child: this,
            )
          : AnimatedPadding(
              duration: duration,
              curve: curve,
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
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Opacity(
              opacity: opacity,
              child: this,
            )
          : AnimatedOpacity(
              duration: duration,
              curve: curve,
              opacity: opacity,
              child: this,
            );

  Widget alignment(
    AlignmentGeometry alignment, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Align(
              alignment: alignment,
              child: this,
            )
          : AnimatedAlign(
              alignment: alignment,
              duration: duration,
              curve: curve,
              child: this,
            );

  Widget backgroundColor(
    Color color, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(color: color),
        duration: duration,
        curve: curve,
      );

  Widget backroundImage(DecorationImage image,
          {Duration duration, Curve curve = Curves.linear}) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(image: image),
        duration: duration,
        curve: curve,
      );

  Widget backgroundGradient(
    Gradient gradient, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(gradient: gradient),
        duration: duration,
        curve: curve,
      );

  Widget backgroundLinearGradient({
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<Color> colors,
    List<double> stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform transform,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: colors,
            stops: stops,
            tileMode: tileMode,
            transform: transform,
          ),
        ),
        duration: duration,
        curve: curve,
      );

  Widget backgroundRadialGradient(
          {AlignmentGeometry center = Alignment.center,
          double radius = 0.5,
          List<Color> colors,
          List<double> stops,
          TileMode tileMode = TileMode.clamp,
          AlignmentGeometry focal,
          double focalRadius = 0.0,
          GradientTransform transform,
          Duration duration,
          Curve curve = Curves.linear}) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(
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
        ),
        duration: duration,
        curve: curve,
      );

  Widget backgroundSweepGradient({
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = pi * 2,
    List<Color> colors,
    List<double> stops,
    TileMode tileMode = TileMode.clamp,
    GradientTransform transform,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            center: center,
            startAngle: startAngle,
            endAngle: endAngle,
            colors: colors,
            stops: stops,
            tileMode: tileMode,
            transform: transform,
          ),
        ),
        duration: duration,
        curve: curve,
      );

  Widget backgroundBlendMode(
    BlendMode blendMode, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(backgroundBlendMode: blendMode),
        duration: duration,
        curve: curve,
      );

  Widget backgroundBlur(double value) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: value,
          sigmaY: value,
        ),
        child: this,
      );

  Widget borderRadius({
    double all,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      ClipRRect(
        child: this,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft ?? all ?? 0.0),
          topRight: Radius.circular(topRight ?? all ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
        ),
      );

  Widget clipOval() => ClipOval(child: this);

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
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(
          backgroundBlendMode: backgroundBlendMode,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          color: color,
          gradient: gradient,
          image: image,
          shape: shape,
        ),
        position: position,
        duration: duration,
        curve: curve,
      );

  Widget elevation(
    double elevation, {
    double angle = 0.0,
    Color color = const Color(0x33000000),
    double opacity = 1.0,
    Duration duration,
    Curve curve = Curves.linear,
  }) {
    double calculatedOpacity = (0.5 - (sqrt(elevation) / 19)) * opacity;
    if (calculatedOpacity <= 0.0) return this;
    BoxDecoration decoration = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(calculatedOpacity),
          blurRadius: elevation,
          spreadRadius: 0.0,
          offset: Offset(sin(angle) * elevation, cos(angle) * elevation),
        ),
      ],
    );
    return _tryMergeDecoration(
      decoration: decoration,
      duration: duration,
      curve: curve,
    );
  }

  Widget boxShadow(
          {Color color = const Color(0xFF000000),
          Offset offset = Offset.zero,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Duration duration,
          Curve curve = Curves.linear}) =>
      _tryMergeDecoration(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: offset,
            ),
          ],
        ),
        duration: duration,
        curve: curve,
      );

  Widget constraints({
    double width,
    double height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
    Duration duration,
    Curve curve = Curves.linear,
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
    return _tryMergeConstraints(
      constraints: constraints,
      duration: duration,
      curve: curve,
    );
  }

  Widget width(
    double width, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeConstraints(
        constraints: BoxConstraints(
          minWidth: width,
          maxWidth: width,
        ),
        duration: duration,
        curve: curve,
      );

  Widget height(
    double height, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      _tryMergeConstraints(
        constraints: BoxConstraints(
          minHeight: height,
          maxHeight: height,
        ),
        duration: duration,
        curve: curve,
      );

  Widget ripple() => Material(
        color: Colors.transparent,
        child: InkWell(
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
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Transform.rotate(
              angle: angle,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              child: this,
            )
          : AnimatedTransform(
              child: this,
              transform: Matrix4.rotationZ(angle),
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              duration: duration,
              curve: curve,
            );

  Widget scale(
    double scale, {
    Offset origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Transform.scale(
              scale: scale,
              alignment: alignment,
              child: this,
              origin: origin,
              transformHitTests: transformHitTests,
            )
          : AnimatedTransform(
              child: this,
              transform: Matrix4.diagonal3Values(scale, scale, 1.0),
              alignment: alignment,
              transformHitTests: transformHitTests,
              duration: duration,
              curve: curve,
            );

  Widget translate({
    @required Offset offset,
    bool transformHitTests = true,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Transform.translate(
              offset: offset,
              transformHitTests: transformHitTests,
              child: this,
            )
          : AnimatedTransform(
              child: this,
              transform: Matrix4.translationValues(offset.dx, offset.dy, 0.0),
              transformHitTests: transformHitTests,
              duration: duration,
              curve: curve,
            );

  Widget transform({
    @required Matrix4 transform,
    Offset origin,
    AlignmentGeometry alignment,
    bool transformHitTests = true,
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? Transform(
              transform: transform,
              alignment: alignment,
              origin: origin,
              transformHitTests: transformHitTests,
              child: this,
            )
          : AnimatedTransform(
              child: this,
              transform: transform,
              origin: origin,
              duration: duration,
              alignment: alignment,
              curve: curve,
              transformHitTests: transformHitTests,
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
    GestureIsTapCallback isTap,
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
          if (isTap != null) isTap(true);
        },
        onTapUp: (TapUpDetails tapUpDetails) {
          if (onTapUp != null) onTapUp(tapUpDetails);
          if (isTap != null) isTap(false);
        },
        onTapCancel: () {
          if (onTapCancel != null) onTapCancel();
          if (isTap != null) isTap(false);
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
