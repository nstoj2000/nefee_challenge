import 'package:crop/crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_state.dart';
import 'package:nefee_dev_challenge/shared/widgets/app_bar.dart';
import 'package:nefee_dev_challenge/shared/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.profileHeight,
    this.cropController,
  });

  final double profileHeight;
  final CropController? cropController;

  @override
  Widget build(BuildContext context) {
    final cropperHeight = profileHeight * 0.6;
    return SizedBox(
      height: profileHeight - Constants.titleAllowance,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Stack(
            children: [
              Image.asset(
                'assets/pattern.jpeg',
                height: profileHeight - Constants.titleAllowance,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              if (cropController != null && state.photo != null) ...[
                Container(
                  height:
                      profileHeight - cropperHeight - Constants.titleAllowance,
                  color: Colors.black.withOpacity(0.3),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: cropperHeight,
                      child: Crop(
                        shape: BoxShape.circle,
                        controller: cropController!,
                        dimColor: Colors.black.withOpacity(0.3),
                        backgroundColor: Colors.transparent,
                        child: Image.file(state.photo!),
                      ),
                    ),
                  ),
                )
              ] else if (state.photo != null)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: cropperHeight,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.file(
                        state.photo!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              const DemoAppBar(
                title: 'Profile',
                showEdit: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
