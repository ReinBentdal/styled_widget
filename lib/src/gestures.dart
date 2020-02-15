part of '../styled_widget.dart';

class _StyledGestureDetector extends InheritedWidget {
  final GestureDetector gestureDetector;
  _StyledGestureDetector({this.gestureDetector}) : super(child: gestureDetector);

    @override
  bool updateShouldNotify(_StyledGestureDetector oldAnimation) =>
      gestureDetector != oldAnimation?.gestureDetector;

  static _StyledGestureDetector of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_StyledGestureDetector>();
}