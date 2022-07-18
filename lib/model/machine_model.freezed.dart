// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'machine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Machine _$MachineFromJson(Map<String, dynamic> json) {
  return _Machine.fromJson(json);
}

/// @nodoc
mixin _$Machine {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MachineCopyWith<Machine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineCopyWith<$Res> {
  factory $MachineCopyWith(Machine value, $Res Function(Machine) then) =
      _$MachineCopyWithImpl<$Res>;
  $Res call({int id, String title, bool isFailure});
}

/// @nodoc
class _$MachineCopyWithImpl<$Res> implements $MachineCopyWith<$Res> {
  _$MachineCopyWithImpl(this._value, this._then);

  final Machine _value;
  // ignore: unused_field
  final $Res Function(Machine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isFailure = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MachineCopyWith<$Res> implements $MachineCopyWith<$Res> {
  factory _$$_MachineCopyWith(
          _$_Machine value, $Res Function(_$_Machine) then) =
      __$$_MachineCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title, bool isFailure});
}

/// @nodoc
class __$$_MachineCopyWithImpl<$Res> extends _$MachineCopyWithImpl<$Res>
    implements _$$_MachineCopyWith<$Res> {
  __$$_MachineCopyWithImpl(_$_Machine _value, $Res Function(_$_Machine) _then)
      : super(_value, (v) => _then(v as _$_Machine));

  @override
  _$_Machine get _value => super._value as _$_Machine;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isFailure = freezed,
  }) {
    return _then(_$_Machine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isFailure: isFailure == freezed
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Machine implements _Machine {
  _$_Machine({required this.id, required this.title, required this.isFailure});

  factory _$_Machine.fromJson(Map<String, dynamic> json) =>
      _$$_MachineFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final bool isFailure;

  @override
  String toString() {
    return 'Machine(id: $id, title: $title, isFailure: $isFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Machine &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.isFailure, isFailure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isFailure));

  @JsonKey(ignore: true)
  @override
  _$$_MachineCopyWith<_$_Machine> get copyWith =>
      __$$_MachineCopyWithImpl<_$_Machine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MachineToJson(
      this,
    );
  }
}

abstract class _Machine implements Machine {
  factory _Machine(
      {required final int id,
      required final String title,
      required final bool isFailure}) = _$_Machine;

  factory _Machine.fromJson(Map<String, dynamic> json) = _$_Machine.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  bool get isFailure;
  @override
  @JsonKey(ignore: true)
  _$$_MachineCopyWith<_$_Machine> get copyWith =>
      throw _privateConstructorUsedError;
}
