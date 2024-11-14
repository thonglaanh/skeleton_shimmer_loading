///
/// A package provides an easy way to add skeleton loading shimmer effect to Flutter application by Nguyen Huu Thong Nghe An 2003
///
library skeleton_shimmer_loading;

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// AppShimmerLoading must wrap ShimmerItem to receive isLoading
class AppShimmerLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;
  final Duration? period;
  final ShimmerDirection? direction;

  const AppShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.borderRadius,
    this.period,
    this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return _ShimmerInherited(
      isLoading: isLoading,
      baseColor: baseColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,
      period: period,
      direction: direction,
      child: child,
    );
  }
}

class ShimmerItem extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final bool? isFitChild;

  const ShimmerItem({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.isFitChild = false,
  });

  @override
  Widget build(BuildContext context) {
    final inherited = _ShimmerInherited.of(context);
    final isLoading = inherited?.isLoading ?? false;

    return isLoading
        ? Shimmer.fromColors(
            baseColor: inherited?.baseColor ?? Colors.grey[300]!,
            highlightColor: inherited?.highlightColor ?? Colors.grey[100]!,
            period: inherited?.period ?? const Duration(milliseconds: 1500),
            enabled: isLoading,
            direction: inherited?.direction ?? ShimmerDirection.ltr,
            child: Container(
              decoration: isFitChild == true
                  ? null
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
              width: width,
              height: height,
              child: width == null && height == null ? child : null,
            ),
          )
        : child;
  }
}

class _ShimmerInherited extends InheritedWidget {
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;
  final Duration? period;
  final ShimmerDirection? direction;

  const _ShimmerInherited(
      {super.key,
      required this.isLoading,
      required super.child,
      this.baseColor,
      this.highlightColor,
      this.period,
      this.borderRadius,
      this.direction});

  @override
  bool updateShouldNotify(_ShimmerInherited oldWidget) {
    return isLoading != oldWidget.isLoading ||
        baseColor != oldWidget.baseColor ||
        highlightColor != oldWidget.highlightColor ||
        borderRadius != oldWidget.borderRadius ||
        period != oldWidget.period ||
        direction != oldWidget.direction;
  }

  static _ShimmerInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ShimmerInherited>();
  }
}
