import 'package:flutter/widgets.dart';

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

  Icon iconSize(double size) => this.copyWith(size: size);

  Icon iconColor(Color color) => this.copyWith(color: color);
}
