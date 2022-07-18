import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/models/machines.dart';
import 'package:twoh/repository/local_api_repository.dart';

part 'machine_data_event.dart';
part 'machine_data_state.dart';

class MachineDataBloc extends Bloc<MachineDataEvent, MachineDataState> {
  final LocalApiRepository localApiRepository;
  MachineDataBloc(this.localApiRepository) : super(MachineDataInitial()) {
    on<MachineDataEvent>((event, emit) async {
      if (event is LoadMachineDataEvent) {
        emit(MachineDataLoadingState());
        List<Machines>? apiResult = await localApiRepository.fetchData();
        if (apiResult == null) {
          emit(MachineDataErrorState());
        }
        emit(MachineDataLoadedState(apiResult: apiResult));
      }
    });
  }
}
