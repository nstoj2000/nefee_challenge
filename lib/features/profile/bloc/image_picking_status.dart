import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_picking_status.freezed.dart';

@freezed
class ImagePickingStatus with _$ImagePickingStatus {
  const ImagePickingStatus._();
  const factory ImagePickingStatus.empty() = _Empty;
  const factory ImagePickingStatus.imageSelected() = _ImageSelected;
  const factory ImagePickingStatus.imageCropped() = _ImageCropped;

  bool get empty => maybeMap(
        empty: (_) => true,
        orElse: () => false,
      );

  bool get imageSelected => maybeMap(
        imageSelected: (_) => true,
        orElse: () => false,
      );

  bool get imageCropped => maybeMap(
        imageCropped: (_) => true,
        orElse: () => false,
      );
}
