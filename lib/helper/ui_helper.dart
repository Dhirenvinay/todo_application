import 'package:flutter/material.dart';

class UIHelper {
  static void showCustomBottomSheet({
    required BuildContext context,
    required Widget child,
    Color? backgroundColor,
    double? elevation,
    BorderRadius? borderRadius,
    Duration animationDuration = const Duration(milliseconds: 200),
    bool isScrollControlled = true,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      elevation: elevation ?? 0,
      builder:
          (context) => AnimatedContainer(
            duration: animationDuration,
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius:
                  borderRadius ??
                  const BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow:
                  elevation != null && elevation > 0
                      ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ]
                      : null,
            ),
            child: ClipRRect(
              borderRadius:
                  borderRadius ??
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: child,
            ),
          ),
    );
  }
}
