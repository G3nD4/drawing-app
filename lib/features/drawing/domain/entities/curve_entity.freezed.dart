// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curve_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurveEntity {
  List<Offset> get points => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurveEntityCopyWith<CurveEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurveEntityCopyWith<$Res> {
  factory $CurveEntityCopyWith(
          CurveEntity value, $Res Function(CurveEntity) then) =
      _$CurveEntityCopyWithImpl<$Res, CurveEntity>;
  @useResult
  $Res call({List<Offset> points, Color color, double strokeWidth});
}

/// @nodoc
class _$CurveEntityCopyWithImpl<$Res, $Val extends CurveEntity>
    implements $CurveEntityCopyWith<$Res> {
  _$CurveEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? color = null,
    Object? strokeWidth = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurveEntityImplCopyWith<$Res>
    implements $CurveEntityCopyWith<$Res> {
  factory _$$CurveEntityImplCopyWith(
          _$CurveEntityImpl value, $Res Function(_$CurveEntityImpl) then) =
      __$$CurveEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Offset> points, Color color, double strokeWidth});
}

/// @nodoc
class __$$CurveEntityImplCopyWithImpl<$Res>
    extends _$CurveEntityCopyWithImpl<$Res, _$CurveEntityImpl>
    implements _$$CurveEntityImplCopyWith<$Res> {
  __$$CurveEntityImplCopyWithImpl(
      _$CurveEntityImpl _value, $Res Function(_$CurveEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? color = null,
    Object? strokeWidth = null,
  }) {
    return _then(_$CurveEntityImpl(
      null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Offset>,
      null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CurveEntityImpl extends _CurveEntity {
  const _$CurveEntityImpl(this.points,
      [this.color = Colors.black, this.strokeWidth = 4.0])
      : super._();

  @override
  final List<Offset> points;
  @override
  @JsonKey()
  final Color color;
  @override
  @JsonKey()
  final double strokeWidth;

  @override
  String toString() {
    return 'CurveEntity(points: $points, color: $color, strokeWidth: $strokeWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurveEntityImpl &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(points), color, strokeWidth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurveEntityImplCopyWith<_$CurveEntityImpl> get copyWith =>
      __$$CurveEntityImplCopyWithImpl<_$CurveEntityImpl>(this, _$identity);
}

abstract class _CurveEntity extends CurveEntity {
  const factory _CurveEntity(final List<Offset> points,
      [final Color color, final double strokeWidth]) = _$CurveEntityImpl;
  const _CurveEntity._() : super._();

  @override
  List<Offset> get points;
  @override
  Color get color;
  @override
  double get strokeWidth;
  @override
  @JsonKey(ignore: true)
  _$$CurveEntityImplCopyWith<_$CurveEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
