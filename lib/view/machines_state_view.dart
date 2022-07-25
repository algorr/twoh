import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/routes/custom_router.gr.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';
import '../models/machines.dart';
import '../widgets/just_image.dart';
import '../widgets/draw/left_lines_and_dots.dart';
import '../widgets/draw/right_lines_and_dots.dart';

class MachineStateView extends StatelessWidget {
  const MachineStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MachineDataBloc, MachineDataState>(
      listener: (context, state) {
        BlocProvider.of<MachineDataBloc>(context).stream;
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("2H Machines"),
              centerTitle: true,
              backgroundColor: Colors.amber,
            ),
            backgroundColor: Colors.grey.shade300,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  state is MachineDataLoadedState
                      ? buildMachines(state.apiResult, size)
                      : Container(),
                ],
              ),
            ));
      },
    );
  }
}

Widget buildMachines(List<Machines>? apiResult, Size size) {
  return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: apiResult!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.router
                .push(MachineDetailViewRoute(machine: apiResult[index]));
          },
          child: index % 2 == 0
              ? RightMachineAndLineRow(
                  size: size,
                  imagePath: apiResult[index].imagePath!,
                  color: apiResult[index].isFailure == true
                      ? Colors.red
                      : Colors.white,
                )
              : LeftMachineAndLineRow(
                  size: size,
                  imagePath: apiResult[index].imagePath!,
                  color: apiResult[index].isFailure == true
                      ? Colors.red
                      : Colors.white,
                ),
        );
      });
}

class LeftMachineAndLineRow extends StatelessWidget {
  const LeftMachineAndLineRow(
      {Key? key,
      required this.size,
      required this.imagePath,
      required this.color})
      : super(key: key);

  final Size size;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * .15,
              width: size.width * .45,
              child: JustImage(
                imageUrl: imagePath,
                color: color,
              ),
            ),
          ],
        ),
        const LeftLineAndDots(),
      ],
    );
  }
}

class RightMachineAndLineRow extends StatelessWidget {
  const RightMachineAndLineRow(
      {Key? key,
      required this.size,
      required this.imagePath,
      required this.color})
      : super(key: key);

  final Size size;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const RightLineAndDots(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * .15,
              width: size.width * .45,
              child: JustImage(
                imageUrl: imagePath,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FirstMachineRow extends StatelessWidget {
  const FirstMachineRow(
      {Key? key,
      required this.size,
      required this.imagePath,
      required this.color})
      : super(key: key);

  final Size size;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: size.height * .15,
          width: size.width * .5,
          child: JustImage(
            imageUrl: imagePath,
            color: color,
          ),
        ),
      ],
    );
  }
}
