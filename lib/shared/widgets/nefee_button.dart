import 'package:flutter/material.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';

class NefeeButton extends StatelessWidget {
  const NefeeButton({
    super.key,
    this.theme,
    this.leading,
    required this.label,
    this.onTap,
  });

  final NefeeButtonTheme? theme;
  final IconData? leading;
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme?.backgroundColor,
        gradient: theme?.backgroundGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) ...[
                  Icon(
                    leading,
                    color: theme?.foregroundColor,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme?.foregroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NefeeButtonTheme {
  NefeeButtonTheme({
    this.backgroundColor,
    this.backgroundGradient,
    required this.foregroundColor,
  });
  factory NefeeButtonTheme.primary() => NefeeButtonTheme(
        backgroundGradient: AppColors.buttonGradient,
        foregroundColor: Colors.white,
      );

  factory NefeeButtonTheme.secondary() => NefeeButtonTheme(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.navy,
      );

  factory NefeeButtonTheme.disabled() => NefeeButtonTheme(
        foregroundColor: Colors.grey,
        backgroundColor: Colors.grey.shade600,
      );

  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;
  final Color foregroundColor;
}
