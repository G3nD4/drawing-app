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

  /// Create a copy of CurveEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CurveEntity
  /// with the given fields replaced by the non-null parameter values.
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

  /// Create a copy of CurveEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? color = null,
    Object? strokeWidth = null,
  }) {
    return _then(_$CurveEntityImpl(
      null == points
          ? _value._points
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
  const _$CurveEntityImpl(final List<Offset> points,
      [this.color = Colors.black, this.strokeWidth = 4.0])
      : _points = points,
        super._();

  final List<Offset> _points;
  @override
  List<Offset> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

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
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_points), color, strokeWidth);

  /// Create a copy of CurveEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of CurveEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurveEntityImplCopyWith<_$CurveEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
