import 'package:flutter/material.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.navyLight),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 80,
                height: 5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            if (child != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: child!,
              ),
          ],
        ),
      ),
    );
  }
}
