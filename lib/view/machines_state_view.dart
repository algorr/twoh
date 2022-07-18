import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/model/machine_model.dart';
import 'package:twoh/routes/custom_router.gr.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';
import '../models/machines.dart';
import '../widgets/just_image.dart';
import '../widgets/left_lines_and_dots.dart';
import '../widgets/right_lines_and_dots.dart';

class MachineStateView extends StatelessWidget {
  const MachineStateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MachineDataBloc, MachineDataState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("2H Machines"),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          backgroundColor: Colors.grey.shade300,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * .001, horizontal: size.width * .03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Machines",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      
                    ],
                  ),
                  state is MachineDataLoadedState
                          ? buildMachines(state.apiResult, size)
                          : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildMachines(List<Machines>? apiResult, Size size) {
  return SizedBox(
    height: size.height*2,
    width: size.width,
    child: ListView.builder(
      //shrinkWrap: true,
        itemCount: apiResult!.length,
        itemBuilder: (context, index) {
          final Machines machineModel = apiResult[index];
          return InkWell(
            onTap: () {
              context.router
                  .push(MachineDetailViewRoute(machine: apiResult[index]));
            },
            child: index % 2 ==0 ? RightMachineAndLineRow(size: size, imagePath: "assets/images/1.png") : LeftMachineAndLineRow(size: size, imagePath:  "assets/images/1.png"),
          );
        }),
  );
}

class LeftMachineAndLineRow extends StatelessWidget {
  const LeftMachineAndLineRow(
      {Key? key, required this.size, required this.imagePath})
      : super(key: key);

  final Size size;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * .15,
              width: size.width * .5,
              child: JustImage(imageUrl: imagePath),
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
      {Key? key, required this.size, required this.imagePath})
      : super(key: key);

  final Size size;
  final String imagePath;

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
              width: size.width * .5,
              child: JustImage(imageUrl: imagePath),
            ),
          ],
        ),
      ],
    );
  }
}

class FirstMachineRow extends StatelessWidget {
  const FirstMachineRow({Key? key, required this.size, required this.imagePath})
      : super(key: key);

  final Size size;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: size.height * .15,
          width: size.width * .5,
          child: JustImage(imageUrl: imagePath),
        ),
      ],
    );
  }
}





/* GestureDetector(
                    child: FirstMachineRow(
                      size: size,
                      imagePath: "assets/images/1.png",
                    ),
                    onTap: () {
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MachineDetailView(apiResult: state.apiResult)));
                      context.router
                          .push(MachineDetailViewRoute(machine: null));
                    },
                  ),
                  GestureDetector(
                      child: RightMachineAndLineRow(
                        size: size,
                        imagePath: "assets/images/2.png",
                      ),
                      onTap: () {}),
                  GestureDetector(
                      child: LeftMachineAndLineRow(
                        size: size,
                        imagePath: "assets/images/3.png",
                      ),
                      onTap: () {}),
                  GestureDetector(
                      child: RightMachineAndLineRow(
                        size: size,
                        imagePath: "assets/images/4.png",
                      ),
                      onTap: () {}),
                  GestureDetector(
                      child: LeftMachineAndLineRow(
                        size: size,
                        imagePath: "assets/images/5.png",
                      ),
                      onTap: () {}),*/