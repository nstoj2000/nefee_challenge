import 'dart:io';
import 'dart:ui';

import 'package:crop/crop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_event.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_state.dart';
import 'package:nefee_dev_challenge/features/profile/widgets/bottom_sheet_container.dart';
import 'package:nefee_dev_challenge/features/profile/widgets/profile_header.dart';
import 'package:nefee_dev_challenge/shared/app_colors.dart';
import 'package:nefee_dev_challenge/shared/widgets/nefee_button.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePhotoView extends StatefulWidget {
  const ProfilePhotoView({super.key});

  @override
  State<ProfilePhotoView> createState() => _ProfilePhotoViewState();
}

class _ProfilePhotoViewState extends State<ProfilePhotoView> {
  final CropController cropController = CropController();

  @override
  Widget build(BuildContext context) {
    final profileHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold(
      backgroundColor: AppColors.navyLight,
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            final hasPicked = !state.imagePickingStatus.empty && !state.imagePickingStatus.imageCropped;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileHeader(
                  profileHeight: profileHeight,
                  cropController: hasPicked ? cropController : null,
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    color: AppColors.navy,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BottomSheetContainer(
                        child: hasPicked
                            ? _CropPhotoButtons(cropController)
                            : const _PickPhotoButtons(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CropPhotoButtons extends StatelessWidget {
  const _CropPhotoButtons(this.cropController);

  final CropController? cropController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NefeeButton(
            label: 'Choose another photo',
            leading: Icons.image_outlined,
            theme: NefeeButtonTheme.secondary(),
            onTap: () => _pickImage(context, ImageSource.gallery)),
        NefeeButton(
          label: 'Save and continue',
          onTap: () => cropImage(context),
          theme: NefeeButtonTheme.primary(),
        ),
      ],
    );
  }

  Future<void> cropImage(BuildContext context) async {
    final image = await cropController?.crop();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final uint8list = byteData?.buffer.asUint8List();

    if (uint8list != null) {
      final xfile = XFile.fromData(uint8list);
      Directory dir = await getApplicationDocumentsDirectory();

      // Create a file path using the directory path and file name
      final formatter = DateFormat('dd MM yyyy hh mm ss');
      String filePath = '${dir.path}/${formatter.format(DateTime.now())}.png';
      await xfile.saveTo(filePath);
      final file = File(filePath);

      print(file.path);
      if (context.mounted) {
        context.read<ProfileBloc>().add(ImageCroppedEvent(file));
      }
    }
  }
}

class _PickPhotoButtons extends StatelessWidget {
  const _PickPhotoButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NefeeButton(
            label: 'Take a photo',
            leading: Icons.camera_alt_outlined,
            theme: NefeeButtonTheme.secondary(),
            onTap: () => _pickImage(context, ImageSource.camera)),
        NefeeButton(
          label: 'Upload from photos',
          leading: Icons.image_outlined,
          onTap: () => _pickImage(context, ImageSource.gallery),
          theme: NefeeButtonTheme.secondary(),
        ),
      ],
    );
  }
}

Future<void> _pickImage(BuildContext context, ImageSource source) async {
  final photo = await ImagePicker().pickImage(source: source);
  if (photo != null) {
    if (context.mounted) {
      context.read<ProfileBloc>().add(ImagePickedEvent(File(photo.path)));
    }
  }
}
