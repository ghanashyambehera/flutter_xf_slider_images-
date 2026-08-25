import 'package:flutter/material.dart';

/// Page dots whose size scales with the carousel height.
class SliderPageIndicator extends StatelessWidget {
  const SliderPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    required this.carouselHeight,
    this.activeColor,
    this.inactiveColor,
    this.onDotTap,
  });

  final int count;
  final int currentIndex;
  final double carouselHeight;
  final Color? activeColor;
  final Color? inactiveColor;
  final ValueChanged<int>? onDotTap;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final active = activeColor ?? theme.colorScheme.primary;
    final inactive =
        inactiveColor ?? theme.colorScheme.onSurface.withValues(alpha: 0.28);

    final dotHeight = (carouselHeight * 0.04).clamp(6.0, 10.0);
    final activeWidth = dotHeight * 2.6;
    final gap = (carouselHeight * 0.03).clamp(4.0, 8.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return GestureDetector(
          onTap: onDotTap == null ? null : () => onDotTap!(index),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: gap / 2, vertical: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: dotHeight,
              width: isActive ? activeWidth : dotHeight,
              decoration: BoxDecoration(
                color: isActive ? active : inactive,
                borderRadius: BorderRadius.circular(dotHeight),
              ),
            ),
          ),
        );
      }),
    );
  }
}
