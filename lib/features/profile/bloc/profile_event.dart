import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class ProfileEvent {}

class PropertyChangeEvent extends ProfileEvent {
  PropertyChangeEvent(this.propertyName, this.propertyValue);

  final String propertyValue;
  final String propertyName;
}

class SetStatePropertyEvent extends ProfileEvent {
  SetStatePropertyEvent(this.propertyName, this.propertyValue);

  final String propertyValue;
  final String propertyName;
}

class LoadingCompleteEvent extends ProfileEvent {}

class LoadingStartedEvent extends ProfileEvent {}

class ImagePickedEvent extends ProfileEvent {
  ImagePickedEvent(this.file);
  final File file;
}

class ImageCroppedEvent extends ProfileEvent {
  ImageCroppedEvent(this.file);
  final File file;
}
