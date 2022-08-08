part of 'machine_data_bloc.dart';

abstract class MachineDataEvent extends Equatable {}

class MachineLoadDataEvent extends MachineDataEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class MachinePatchDataEvent extends MachineDataEvent {
  final Machines machines;

  MachinePatchDataEvent(this.machines);

  @override
  List<Object?> get props => [machines];
}

class MachineDataStreamEvent extends MachineDataEvent {
  final Machines machines;

  MachineDataStreamEvent(this.machines);

  @override
  List<Object?> get props => [machines];
}
