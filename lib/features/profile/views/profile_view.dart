import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/widgets/profile_form.dart';
import 'package:nefee_dev_challenge/features/profile/widgets/profile_header.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';
import 'package:nefee_dev_challenge/shared/constants.dart';
import 'package:nefee_dev_challenge/shared/loading_wrapper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final profileHeight = screenHeight / 3;
    final formHeight = screenHeight - profileHeight;
    final isLoading = context.watch<ProfileBloc>().state.isLoading;
    return Scaffold(
      backgroundColor: AppColors.navyDark,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          child: LoadingWrapper(
            isLoading: isLoading,
            child: Stack(
              children: [
                ProfileHeader(profileHeight: profileHeight),
                const SizedBox(height: 4),
                Positioned(
                  top: profileHeight-Constants.titleAllowance,
                  height: formHeight,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: Constants.titleAllowance*2),
                    decoration: const BoxDecoration(
                      gradient: AppColors.gradient,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileForm(),
                        ListTile(
                          leading: Icon(
                            Icons.restart_alt,
                            color: AppColors.teal,
                            size: 32,
                          ),
                          visualDensity: VisualDensity.standard,
                          title: Text('Reset Password'),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.logout,
                              color: AppColors.teal,
                              size: 32,
                            ),
                          ),
                          visualDensity: VisualDensity.standard,
                          title: Text('Sign out'),
                          trailing: Icon(
                            Icons.delete_outline,
                            color: AppColors.teal,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: profileHeight - Constants.titleAllowance * 2,
                  left: 0,
                  right: 0,
                  height: Constants.titleAllowance * 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: IntrinsicWidth(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: AppColors.navyLight,
                        ),
                        child: const Row(
                          children: [
                            Text('@username'),
                            SizedBox(width: 8),
                            Icon(
                              Icons.people_alt_outlined,
                              color: AppColors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
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
