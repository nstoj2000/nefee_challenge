import 'package:flutter/material.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper(
      {super.key, required this.isLoading, required this.child});

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.teal,
            ),
          )
        : child;
  }
}
