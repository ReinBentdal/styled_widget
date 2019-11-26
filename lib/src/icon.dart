import 'package:flutter/widgets.dart';
/*
Style methods specific for the [Icon] widget should be applied here
*/

extension IconExtension on Icon {
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

  Icon size(double size) => this.copyWith(size: size);

  Icon color(Color color) => this.copyWith(color: color);
}
