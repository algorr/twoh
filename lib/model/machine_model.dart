import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine_model.freezed.dart';
part 'machine_model.g.dart';

@freezed
class Machine with _$Machine {
  factory Machine({
    required int id,
    required String title,
    required bool isFailure,
  }) = _Machine;

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
}
