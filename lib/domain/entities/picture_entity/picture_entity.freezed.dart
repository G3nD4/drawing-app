// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PictureEntity _$PictureEntityFromJson(Map<String, dynamic> json) {
  return _PictureEntity.fromJson(json);
}

/// @nodoc
mixin _$PictureEntity {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: PictureEntity.curvesFromJson,
      toJson: PictureEntity.curvesToJson)
  List<CurveEntity> get curves => throw _privateConstructorUsedError;
  @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PictureEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PictureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PictureEntityCopyWith<PictureEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureEntityCopyWith<$Res> {
  factory $PictureEntityCopyWith(
          PictureEntity value, $Res Function(PictureEntity) then) =
      _$PictureEntityCopyWithImpl<$Res, PictureEntity>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          fromJson: PictureEntity.curvesFromJson,
          toJson: PictureEntity.curvesToJson)
      List<CurveEntity> curves,
      @Assert('name.isNotEmpty', 'Picture name cannot be empty!') String name});
}

/// @nodoc
class _$PictureEntityCopyWithImpl<$Res, $Val extends PictureEntity>
    implements $PictureEntityCopyWith<$Res> {
  _$PictureEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PictureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? curves = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      curves: null == curves
          ? _value.curves
          : curves // ignore: cast_nullable_to_non_nullable
              as List<CurveEntity>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureEntityImplCopyWith<$Res>
    implements $PictureEntityCopyWith<$Res> {
  factory _$$PictureEntityImplCopyWith(
          _$PictureEntityImpl value, $Res Function(_$PictureEntityImpl) then) =
      __$$PictureEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(
          fromJson: PictureEntity.curvesFromJson,
          toJson: PictureEntity.curvesToJson)
      List<CurveEntity> curves,
      @Assert('name.isNotEmpty', 'Picture name cannot be empty!') String name});
}

/// @nodoc
class __$$PictureEntityImplCopyWithImpl<$Res>
    extends _$PictureEntityCopyWithImpl<$Res, _$PictureEntityImpl>
    implements _$$PictureEntityImplCopyWith<$Res> {
  __$$PictureEntityImplCopyWithImpl(
      _$PictureEntityImpl _value, $Res Function(_$PictureEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of PictureEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? curves = null,
    Object? name = null,
  }) {
    return _then(_$PictureEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      curves: null == curves
          ? _value._curves
          : curves // ignore: cast_nullable_to_non_nullable
              as List<CurveEntity>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PictureEntityImpl implements _PictureEntity {
  const _$PictureEntityImpl(
      {required this.id,
      @JsonKey(
          fromJson: PictureEntity.curvesFromJson,
          toJson: PictureEntity.curvesToJson)
      required final List<CurveEntity> curves,
      @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
      required this.name})
      : _curves = curves;

  factory _$PictureEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PictureEntityImplFromJson(json);

  @override
  final int id;
  final List<CurveEntity> _curves;
  @override
  @JsonKey(
      fromJson: PictureEntity.curvesFromJson,
      toJson: PictureEntity.curvesToJson)
  List<CurveEntity> get curves {
    if (_curves is EqualUnmodifiableListView) return _curves;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_curves);
  }

  @override
  @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
  final String name;

  @override
  String toString() {
    return 'PictureEntity(id: $id, curves: $curves, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._curves, _curves) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_curves), name);

  /// Create a copy of PictureEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureEntityImplCopyWith<_$PictureEntityImpl> get copyWith =>
      __$$PictureEntityImplCopyWithImpl<_$PictureEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PictureEntityImplToJson(
      this,
    );
  }
}

abstract class _PictureEntity implements PictureEntity {
  const factory _PictureEntity(
      {required final int id,
      @JsonKey(
          fromJson: PictureEntity.curvesFromJson,
          toJson: PictureEntity.curvesToJson)
      required final List<CurveEntity> curves,
      @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
      required final String name}) = _$PictureEntityImpl;

  factory _PictureEntity.fromJson(Map<String, dynamic> json) =
      _$PictureEntityImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(
      fromJson: PictureEntity.curvesFromJson,
      toJson: PictureEntity.curvesToJson)
  List<CurveEntity> get curves;
  @override
  @Assert('name.isNotEmpty', 'Picture name cannot be empty!')
  String get name;

  /// Create a copy of PictureEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PictureEntityImplCopyWith<_$PictureEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
