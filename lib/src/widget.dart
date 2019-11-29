/*
Style methods which is common for all [Widget] widgets should be applied here.
*/
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'animated.dart';

typedef GestureIsTapCallback = void Function(bool isTapped);

extension Styled on Widget {
  static Widget widget([Widget child]) =>
      child ??
      LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      );

  /// If the child widget is of the same type they should merge together
  dynamic _tryMergeDown<T>(T style) {
    switch (this.runtimeType) {
      case BoxDecoration:
        print('boxDecoration should merge');
        // TODO: merge boxDecoration
        break;
      case BoxConstraints:
        print('boxConstraints should merge');
        // TODO: merge boxConstraints
        break;
      case Transform:
        print('transform should merge');
        // TODO: merge transform
        break;
    }
    return widget;
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
  }) {
    _tryMergeDown<BoxDecoration>(BoxDecoration(color: color));
    return duration == null
        ? DecoratedBox(
            decoration: BoxDecoration(color: color),
            child: this,
          )
        : AnimatedDecorationBox(
            decoration: BoxDecoration(color: color),
            duration: duration,
            curve: curve,
            child: this,
          );
  }

  // Widget animatedBackgroundColor(Color color, {@required Duration duration,
  //         @required Curve curve}) =>

  // TODO: animate
  // TODO: if the merge down feature exists, this may be changes to a BoxDecoration widget
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

  // Widget borderRadius({
  //   double all,
  //   double topLeft,
  //   double topRight,
  //   double bottomLeft,
  //   double bottomRight,
  //   Duration duration,
  //   Curve curve = Curves.linear,
  // }) =>
  //     duration == null
  //         ? DecoratedBox(
  //             child: this,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(topLeft ?? all ?? 0.0),
  //                 topRight: Radius.circular(topRight ?? all ?? 0.0),
  //                 bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
  //                 bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
  //               ),
  //             ),
  //           )
  //         : AnimatedDecorationBox(
  //             child: this,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(topLeft ?? all ?? 0.0),
  //                 topRight: Radius.circular(topRight ?? all ?? 0.0),
  //                 bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
  //                 bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
  //               ),
  //             ),
  //             duration: duration,
  //             curve: curve,
  //           );

  // Widget circle({Duration duration, Curve curve = Curves.linear}) =>
  //     duration == null
  //         ? DecoratedBox(
  //             decoration: BoxDecoration(shape: BoxShape.circle),
  //             child: this,
  //           )
  //         : AnimatedDecorationBox(
  //             decoration: BoxDecoration(shape: BoxShape.circle),
  //             child: this,
  //             duration: duration,
  //             curve: curve,
  //           );

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
      duration == null
          ? DecoratedBox(
              child: this,
              position: position,
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
            )
          : AnimatedDecorationBox(
              child: this,
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
    if (duration == null) {
      return DecoratedBox(
        decoration: decoration,
        child: this,
      );
    } else {
      return AnimatedDecorationBox(
        decoration: decoration,
        child: this,
        duration: duration,
        curve: curve,
      );
    }
  }

  Widget boxShadow(
          {Color color = const Color(0xFF000000),
          Offset offset = Offset.zero,
          double blurRadius = 0.0,
          double spreadRadius = 0.0,
          Duration duration,
          Curve curve = Curves.linear}) =>
      duration == null
          ? DecoratedBox(
              child: this,
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
            )
          : AnimatedDecorationBox(
              child: this,
              duration: duration,
              curve: curve,
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
    if (duration == null) {
      return ConstrainedBox(
        constraints: constraints,
        child: this,
      );
    } else {
      return AnimatedConstrainedBox(
        constraints: constraints,
        duration: duration,
        curve: curve,
        child: this,
      );
    }
  }

  Widget width(
    double width, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? ConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(width: width),
            )
          : AnimatedConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(width: width),
              duration: duration,
              curve: curve,
            );

  Widget height(
    double height, {
    Duration duration,
    Curve curve = Curves.linear,
  }) =>
      duration == null
          ? ConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(height: height),
            )
          : AnimatedConstrainedBox(
              child: this,
              constraints: BoxConstraints.tightFor(height: height),
              duration: duration,
              curve: curve,
            );

  Widget ripple() => Material(
        color: Colors.transparent,
        child: InkWell(onTap: () {}, child: this),
      );

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

  Widget scale({
    @required double scale,
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

  // TODO: support for implicit animations
  // .animate(int duration, Curve curve)
}
