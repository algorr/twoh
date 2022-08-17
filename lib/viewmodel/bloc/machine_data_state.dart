part of 'machine_data_bloc.dart';

abstract class MachineDataState extends Equatable {}

class MachineDataInitial extends MachineDataState {
  @override
  List<Object?> get props => [];
}

class MachineDataLoadingState extends MachineDataState {
  @override
  List<Object?> get props => [];
}

class MachineDataLoadedState extends MachineDataState {
  final List<Machines>? apiResult;
 

  MachineDataLoadedState({required this.apiResult});

  @override
  List<Object?> get props => [apiResult];
}


class MachineDataErrorState extends MachineDataState {
  @override
  List<Object?> get props => [];
}
