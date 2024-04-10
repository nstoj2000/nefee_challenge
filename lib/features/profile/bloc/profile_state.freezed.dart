// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  UserModel get user => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  ImagePickingStatus get imagePickingStatus =>
      throw _privateConstructorUsedError;
  File? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {UserModel user,
      bool isLoading,
      ImagePickingStatus imagePickingStatus,
      File? photo});

  $UserModelCopyWith<$Res> get user;
  $ImagePickingStatusCopyWith<$Res> get imagePickingStatus;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isLoading = null,
    Object? imagePickingStatus = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePickingStatus: null == imagePickingStatus
          ? _value.imagePickingStatus
          : imagePickingStatus // ignore: cast_nullable_to_non_nullable
              as ImagePickingStatus,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImagePickingStatusCopyWith<$Res> get imagePickingStatus {
    return $ImagePickingStatusCopyWith<$Res>(_value.imagePickingStatus,
        (value) {
      return _then(_value.copyWith(imagePickingStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel user,
      bool isLoading,
      ImagePickingStatus imagePickingStatus,
      File? photo});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $ImagePickingStatusCopyWith<$Res> get imagePickingStatus;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isLoading = null,
    Object? imagePickingStatus = null,
    Object? photo = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      imagePickingStatus: null == imagePickingStatus
          ? _value.imagePickingStatus
          : imagePickingStatus // ignore: cast_nullable_to_non_nullable
              as ImagePickingStatus,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.user = const UserModel(),
      this.isLoading = true,
      this.imagePickingStatus = const ImagePickingStatus.empty(),
      this.photo = null});

  @override
  @JsonKey()
  final UserModel user;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ImagePickingStatus imagePickingStatus;
  @override
  @JsonKey()
  final File? photo;

  @override
  String toString() {
    return 'ProfileState(user: $user, isLoading: $isLoading, imagePickingStatus: $imagePickingStatus, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.imagePickingStatus, imagePickingStatus) ||
                other.imagePickingStatus == imagePickingStatus) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, isLoading, imagePickingStatus, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final UserModel user,
      final bool isLoading,
      final ImagePickingStatus imagePickingStatus,
      final File? photo}) = _$ProfileStateImpl;

  @override
  UserModel get user;
  @override
  bool get isLoading;
  @override
  ImagePickingStatus get imagePickingStatus;
  @override
  File? get photo;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
