import 'package:flutter/widgets.dart';

extension StyledList<E> on List<Widget> {
  Widget toColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: this,
      );

  Widget toRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) =>
      Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: this,
      );

  Widget toStack({
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
  }) =>
      Stack(
        alignment: alignment,
        children: this,
      );
}
