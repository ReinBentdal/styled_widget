part of '../../styled_widget.dart';

extension StyledIcon<T extends Icon> on T {
  T copyWith({
    double? size,
    Color? color,
    String? semanticLabel,
    TextDirection? textDirection,
  }) =>
      (this is _StyledAnimatedIconContainer
          ? _StyledAnimatedIconContainer(
              this.icon,
              color: color ?? this.color,
              size: size ?? this.size,
              semanticLabel: semanticLabel ?? this.semanticLabel,
              textDirection: textDirection ?? this.textDirection,
            )
          : Icon(
              this.icon,
              color: color ?? this.color,
              size: size ?? this.size,
              semanticLabel: semanticLabel ?? this.semanticLabel,
              textDirection: textDirection ?? this.textDirection,
            )) as T;

  T iconSize(double size) => this.copyWith(size: size);

  T iconColor(Color color) => this.copyWith(color: color);
}
