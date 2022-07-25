part of 'machine_data_bloc.dart';

abstract class MachineDataEvent {}

class MachineLoadDataEvent extends MachineDataEvent {}

class MachinePatchDataEvent extends MachineDataEvent {
  final Machines machines;

  MachinePatchDataEvent(this.machines);
}
