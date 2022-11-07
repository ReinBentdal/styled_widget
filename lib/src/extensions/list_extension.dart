part of '../../styled_widget.dart';

extension StyledList<E> on List<Widget> {
  Widget toColumn({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? separator,
  }) =>
      Column(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: separator != null && this.length > 0
            ? (this.expand((child) => [child, separator]).toList()
              ..removeLast())
            : this,
      );

  Widget toRow({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
    Widget? separator,
  }) =>
      Row(
        key: key,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: separator != null && this.length > 0
            ? (this.expand((child) => [child, separator]).toList()
              ..removeLast())
            : this,
      );

  Widget toStack({
    Key? key,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
    List<Widget> children = const <Widget>[],
  }) =>
      Stack(
        key: key,
        alignment: alignment,
        textDirection: textDirection,
        fit: fit,
        clipBehavior: clipBehavior,
        children: this,
      );
  
  Widget toWrap({
    Key? key,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    Clip clipBehavior = Clip.none,
    List<Widget> children = const <Widget>[],
  }) =>
      Wrap(
        key: key,
        direction: direction,
        alignment: alignment,
        spacing: spacing,
        runAlignment: runAlignment,
        runSpacing: runSpacing,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children: this,
      );
}
