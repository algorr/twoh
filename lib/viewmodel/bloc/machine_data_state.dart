part of 'machine_data_bloc.dart';

abstract class MachineDataState {}

class MachineDataInitial extends MachineDataState {}

class MachineDataLoadingState extends MachineDataState {}

class MachineDataLoadedState extends MachineDataState {
  final List<Machines>? apiResult;

  MachineDataLoadedState({required this.apiResult});
}

class MachineDataErrorState extends MachineDataState {}
