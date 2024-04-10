import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{
  const factory UserModel({
    @Default('') String name,
    @Default('') String phoneNumber,
    @Default('') String email,
    @Default('') String title,
  }) = _UserModel;
}