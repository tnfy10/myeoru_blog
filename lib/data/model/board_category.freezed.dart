// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoardCategory _$BoardCategoryFromJson(Map<String, dynamic> json) {
  return _BoardCategory.fromJson(json);
}

/// @nodoc
mixin _$BoardCategory {
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoardCategoryCopyWith<BoardCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCategoryCopyWith<$Res> {
  factory $BoardCategoryCopyWith(
          BoardCategory value, $Res Function(BoardCategory) then) =
      _$BoardCategoryCopyWithImpl<$Res, BoardCategory>;
  @useResult
  $Res call({String label});
}

/// @nodoc
class _$BoardCategoryCopyWithImpl<$Res, $Val extends BoardCategory>
    implements $BoardCategoryCopyWith<$Res> {
  _$BoardCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardCategoryImplCopyWith<$Res>
    implements $BoardCategoryCopyWith<$Res> {
  factory _$$BoardCategoryImplCopyWith(
          _$BoardCategoryImpl value, $Res Function(_$BoardCategoryImpl) then) =
      __$$BoardCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label});
}

/// @nodoc
class __$$BoardCategoryImplCopyWithImpl<$Res>
    extends _$BoardCategoryCopyWithImpl<$Res, _$BoardCategoryImpl>
    implements _$$BoardCategoryImplCopyWith<$Res> {
  __$$BoardCategoryImplCopyWithImpl(
      _$BoardCategoryImpl _value, $Res Function(_$BoardCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
  }) {
    return _then(_$BoardCategoryImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardCategoryImpl implements _BoardCategory {
  const _$BoardCategoryImpl({required this.label});

  factory _$BoardCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardCategoryImplFromJson(json);

  @override
  final String label;

  @override
  String toString() {
    return 'BoardCategory(label: $label)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardCategoryImpl &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardCategoryImplCopyWith<_$BoardCategoryImpl> get copyWith =>
      __$$BoardCategoryImplCopyWithImpl<_$BoardCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardCategoryImplToJson(
      this,
    );
  }
}

abstract class _BoardCategory implements BoardCategory {
  const factory _BoardCategory({required final String label}) =
      _$BoardCategoryImpl;

  factory _BoardCategory.fromJson(Map<String, dynamic> json) =
      _$BoardCategoryImpl.fromJson;

  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$BoardCategoryImplCopyWith<_$BoardCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
