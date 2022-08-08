import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/models/machines.dart';
import 'package:twoh/repository/local_api_repository.dart';

part 'machine_data_event.dart';
part 'machine_data_state.dart';

class MachineDataBloc extends Bloc<MachineDataEvent, MachineDataState> {
  final LocalApiRepository localApiRepository;
  final StreamController<List<Machines>> streamController = StreamController();

  MachineDataBloc(this.localApiRepository) : super(MachineDataInitial()) {
    //When Machines Loaded Event
    on<MachineLoadDataEvent>((event, emit) async {
      // ignore: unnecessary_type_check
      emit(MachineDataLoadingState());
      List<Machines>? apiResult = await localApiRepository.fetchData();
      if (apiResult == null) {
        emit(MachineDataErrorState());
      }
      streamController.add(apiResult!);
      emit(MachineDataLoadedState(apiResult: apiResult));
    });

    on<MachinePatchDataEvent>((event, emit) async {
      await localApiRepository.patchMachineData(
          event.machines.isFailure!, event.machines.id!);
      List<Machines>? apiResult = await localApiRepository.fetchData();
      final currentState = state as MachineDataLoadedState;
      add(MachinePatchDataEvent(event.machines));
      streamController.add(apiResult!);
      emit(MachineDataLoadedState(apiResult: currentState.apiResult));
    });
  }

  void changeComplition(Machines machines) async {
    localApiRepository
        .patchMachineData(!machines.isFailure!, machines.id!)
        .then((isChanged) {
      if (isChanged) {
        machines.isFailure = !machines.isFailure!;
        updateMachineList();
      }
    });
  }

  bool changeFailureState(bool isFailure) {
    print(isFailure);
    isFailure = !isFailure;
    return isFailure;
  }

  void updateMachineList() async{
    final currentState = state;
    if (currentState is MachineDataLoadedState) {
       List<Machines>? apiResult = await localApiRepository.fetchData();
      streamController.sink.add(apiResult!);
      emit(MachineDataLoadedState(apiResult: currentState.apiResult));
    }
  }
}
