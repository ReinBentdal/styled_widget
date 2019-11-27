/*
Style methods which is common for all [Widget] widgets should be applied here.
*/
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef GestureIsTapCallback = void Function(bool isTapped);

extension Styled on Widget {
  static Widget widget([Widget child]) =>
      child ??
      LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );

  EdgeInsetsGeometry _padding(double all, double horizontal, double vertical,
          double top, double bottom, double left, double right) =>
      EdgeInsets.only(
          top: top ?? vertical ?? all ?? 0.0,
          bottom: bottom ?? vertical ?? all ?? 0.0,
          left: left ?? horizontal ?? all ?? 0.0,
          right: right ?? horizontal ?? all ?? 0.0);

  Widget padding(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right}) =>
      Padding(
          padding:
              _padding(all, horizontal, vertical, top, bottom, left, right),
          child: this);

  Widget animatedPadding(
          {double all,
          double horizontal,
          double vertical,
          double top,
          double bottom,
          double left,
          double right,
          @required Duration duration,
          @required Curve curve}) =>
      AnimatedPadding(
        duration: duration,
        curve: curve,
        padding: _padding(all, horizontal, vertical, top, bottom, left, right),
        child: this,
      );

  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  Widget animatedOpacity(double opacity,
          {@required Duration duration, @required Curve curve}) =>
      AnimatedOpacity(
        duration: duration,
        curve: curve,
        opacity: opacity,
        child: this,
      );

  Widget alignment(AlignmentGeometry alignment) =>
      Align(alignment: alignment, child: this);

  Widget animatedAlignment(AlignmentGeometry alignment,
          {@required Duration duration, @required Curve curve}) =>
      AnimatedAlign(
        alignment: alignment,
        duration: duration,
        curve: curve,
        child: this,
      );

  Widget backgroundColor(Color color) =>
      DecoratedBox(decoration: BoxDecoration(color: color), child: this);

  // Widget animatedBackgroundColor(Color color, {@required Duration duration,
  //         @required Curve curve}) =>

  Widget borderRadius(
          {double all,
          double topLeft,
          double topRight,
          double bottomLeft,
          double bottomRight}) =>
      ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft ?? all ?? 0.0),
            topRight: Radius.circular(topRight ?? all ?? 0.0),
            bottomLeft: Radius.circular(bottomLeft ?? all ?? 0.0),
            bottomRight: Radius.circular(bottomRight ?? all ?? 0.0),
          ),
          child: this);

  Widget circle() => DecoratedBox(
      decoration: BoxDecoration(shape: BoxShape.circle), child: this);

  Widget elevation(double elevation,
      {double angle = 0.0,
      Color color = const Color(0x33000000),
      double opacity = 1.0}) {
    double calculatedOpacity = (0.5 - (sqrt(elevation) / 19)) * opacity;
    if (calculatedOpacity <= 0.0) return this;
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(calculatedOpacity),
            blurRadius: elevation,
            spreadRadius: 0.0,
            offset: Offset(sin(angle) * elevation, cos(angle) * elevation),
          ),
        ],
      ),
      child: this,
    );
  }

  Widget constraints({
    double width,
    double height,
    double minWidth = 0.0,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double maxHeight = double.infinity,
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
    return ConstrainedBox(
      constraints: constraints,
      child: this,
    );
  }

  Widget ripple() => Material(
      color: Colors.transparent, child: InkWell(onTap: () {}, child: this));

  Widget semanticsLabel(String label) => Semantics.fromProperties(
      properties: SemanticsProperties(label: label), child: this);

  Widget gestures(
          {GestureIsTapCallback isTap,
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
          DragStartBehavior dragStartBehavior = DragStartBehavior.start}) =>
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
