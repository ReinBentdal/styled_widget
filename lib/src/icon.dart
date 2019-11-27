import 'package:flutter/widgets.dart';
/*
Style methods specific for the [Icon] widget should be applied here
*/

extension StyledIcon on Icon {
  Icon copyWith({
    double size,
    Color color,
    String semanticLabel,
    TextDirection textDirection,
  }) =>
      Icon(this.icon,
          color: color ?? this.color,
          size: size ?? this.size,
          semanticLabel: semanticLabel ?? this.semanticLabel,
          textDirection: textDirection ?? this.textDirection);

  // static Icon icon(IconData icon) => Icon(icon);

  Icon iconSize(double size) => this.copyWith(size: size);

  Icon iconColor(Color color) => this.copyWith(color: color);
}
