import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/image_picking_status.dart';
import 'package:nefee_dev_challenge/models/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(UserModel()) UserModel user,
    @Default(true) bool isLoading,
    @Default(ImagePickingStatus.empty()) ImagePickingStatus imagePickingStatus,
    @Default(null) File? photo,
  }) = _ProfileState;
}
