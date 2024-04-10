import 'package:flutter/material.dart';
import 'package:nefee_dev_challenge/core/routes/named_routes.dart';
import 'package:nefee_dev_challenge/features/profile/views/profile_photo_view.dart';
import 'package:nefee_dev_challenge/features/profile/views/profile_view.dart';

final routes = <String, WidgetBuilder>{
  NamedRoutes.profile: (context) => const ProfileView(),
  NamedRoutes.profilePhoto: (context) => const ProfilePhotoView(),
};
