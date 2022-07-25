import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/view/machines_state_view.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MachineDataBloc, MachineDataState>(
        builder: (context, state) {
          if (state is MachineDataInitial) {
            context.read<MachineDataBloc>().add(MachineLoadDataEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MachineDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MachineDataLoadedState) {
            return const MachineStateView();
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
