import 'package:flutter/material.dart';
import 'package:nefee_dev_challenge/core/routes/named_routes.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';
import 'package:nefee_dev_challenge/shared/widgets/circle_button.dart';

class DemoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DemoAppBar({
    super.key,
    required this.title,
    required this.showEdit,
  });

  final String title;
  final bool showEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 24),
      height: preferredSize.height,
      child: Row(
        children: [
          CircleButton(icon: Icons.arrow_back, onTap: () =>_navigateBack(context)),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.navy,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (showEdit)
            CircleButton(
                icon: Icons.edit_note,
                onTap: () =>
                    Navigator.of(context).pushNamed(NamedRoutes.profilePhoto))
          else
            const SizedBox(
              width: 70,
            ),
        ],
      ),
    );
  }

  void _navigateBack(BuildContext context) {
    final nav = Navigator.of(context);
    if (nav.canPop()) {
      nav.pop();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(42);
}
