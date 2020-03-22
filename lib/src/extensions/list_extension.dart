part of '../../styled_widget.dart';

extension StyledList<E> on List<Widget> {
  Widget toColumn({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    Widget seperator,
  }) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: seperator != null && this.length > 0
            ? this.expand((child) => [child, seperator]).toList().removeLast()
            : this,
      );

  Widget toRow({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    Widget seperator,
  }) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: seperator != null && this.length > 0
            ? this.expand((child) => [child, seperator]).toList().removeLast()
            : this,
      );

  Widget toStack({
    Key key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection textDirection,
    StackFit fit = StackFit.loose,
    Overflow overflow = Overflow.clip,
    List<Widget> children = const <Widget>[],
  }) =>
      Stack(
        key: key,
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        overflow: overflow,
        children: this,
      );
}
