import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/image_picking_status.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_event.dart';
import 'package:nefee_dev_challenge/features/profile/bloc/profile_state.dart';
import 'package:nefee_dev_challenge/models/property_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    _initialize();
    on<PropertyChangeEvent>(_updateProperty);
    on<SetStatePropertyEvent>(_setStateProperty);
    on<LoadingCompleteEvent>(_loadingComplete);
    on<ImagePickedEvent>(_setImage);
    on<ImageCroppedEvent>(_cropImage);
  }

  FutureOr<void> _initialize() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    for (final property in PropertyNames.values) {
      final value = sharedPrefs.getString(property.name) ?? '';
      add(SetStatePropertyEvent(property.name, value));
    }
    add(LoadingCompleteEvent());
  }

  void _loadingComplete(
          LoadingCompleteEvent e, Emitter<ProfileState> emitter) =>
      emitter(state.copyWith(isLoading: false));

  void _setStateProperty(
      SetStatePropertyEvent event, Emitter<ProfileState> emit) {
    var user = state.user;
    switch (event.propertyName) {
      case 'name':
        user = user.copyWith(name: event.propertyValue);
        break;
      case 'phoneNumber':
        user = user.copyWith(phoneNumber: event.propertyValue);
      case 'title':
        user = user.copyWith(title: event.propertyValue);
      case 'email':
        user = user.copyWith(email: event.propertyValue);
    }
    emit(state.copyWith(user: user));
  }

  Future<void> _updateProperty(
      PropertyChangeEvent event, Emitter<ProfileState> emit) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(event.propertyName, event.propertyValue);
    _setStateProperty(
        SetStatePropertyEvent(event.propertyName, event.propertyValue), emit);
  }

  void _setImage(ImagePickedEvent event, Emitter<ProfileState> emit) {
    emit(
      state.copyWith(
        photo: event.file,
        imagePickingStatus: const ImagePickingStatus.imageSelected(),
      ),
    );
  }

  void _cropImage(ImageCroppedEvent event, Emitter<ProfileState> emit) {
    emit(
      state.copyWith(
        photo: event.file,
        imagePickingStatus: const ImagePickingStatus.imageCropped(),
      ),
    );
  }
}
