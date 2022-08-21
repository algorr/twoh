import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';
import 'package:twoh/widgets/create_new_task.dart';
import '../models/machines.dart';

class MachineDetailView extends StatelessWidget {
  final Machines machine;
  const MachineDetailView({Key? key, required this.machine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MachineDataBloc, MachineDataState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            elevation: 0,
            actions: [
              machine.isFailure == true
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.app_registration_rounded),
                        onPressed: () async {
                          final result =
                              await _showModalForInsertDetail(context);
                          if (result != null) {
                            const ScaffoldMessenger(
                              child: SnackBar(content: Text("yuppi")),
                            );
                          }
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: const Icon(Icons.info_outline_rounded),
                        onPressed: () async {
                          final result =
                              await _showModalForInsertDetail(context);
                          if (result != null) {
                            const ScaffoldMessenger(child: Text("Yuppi"));
                          }
                        },
                      ),
                    ),
            ],
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  MachineHeadImageContiner(size: size, machine: machine),
                  MachineNameTextContainer(machine: machine),
                  MachineInfoTextContainer(size: size),
                  MachineErrorLogWidget(size: size, machine: machine),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Text(
                          "Percent Indicators",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  MachineInfoIndicatorsRow(machine: machine),
                  MachinePercentInfoRow(
                    size: size,
                    color: Colors.red,
                    text: "Arıza Süre Oranı",
                  ),
                  MachinePercentInfoRow(
                    size: size,
                    color: Colors.grey,
                    text: "Etkin Süre Oranı",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showModalForInsertDetail(BuildContext context) {
    return showModalBottomSheet(
        elevation: 20,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) {
          return CreateNewTask(machines: machine);
        });
  }
}

class MachineErrorLogWidget extends StatelessWidget {
  const MachineErrorLogWidget(
      {Key? key, required this.size, required this.machine})
      : super(key: key);

  final Size size;
  final Machines machine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(2),
            height: size.height * .2,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]),
            child: ListView.builder(
                itemCount: machine.error != null ? machine.error!.length : 0,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: DataTable(columns: const [
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Arıza Çeşidi")),
                      DataColumn(label: Text("Arıza Durumu")),
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text("${machine.error![index].id}")),
                        DataCell(
                          Text("${machine.error![index].title}"),
                        ),
                        DataCell(
                          Text("${machine.error![index].arizaDurumu}"),
                        ),
                      ])
                    ]),
                  );
                })),
      ],
    );
  }
}

class MachinePercentInfoRow extends StatelessWidget {
  final Color color;
  final String text;
  const MachinePercentInfoRow({
    Key? key,
    required this.size,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: size.height * .009,
            width: size.width * .07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class MachineInfoIndicatorsRow extends StatelessWidget {
  const MachineInfoIndicatorsRow({
    Key? key,
    required this.machine,
  }) : super(key: key);

  final Machines machine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCircularPercentIndicator(
                text: 'WP',
                imagePath: 'assets/images/1.png',
                percent: machine.wpPercent!,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCircularPercentIndicator(
                  text: 'EP',
                  percent: machine.epPercent!,
                  imagePath: 'assets/images/1.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCircularPercentIndicator(
                  text: 'LP',
                  percent: machine.lpPercent!,
                  imagePath: machine.imagePath!),
            ),
          )
        ],
      ),
    );
  }
}

class MachineInfoTextContainer extends StatelessWidget {
  const MachineInfoTextContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: size.width,
          height: size.height * .1,
          child: const Text(
            "Uzun ve ağır bir makine olan kesme makinesi çok kapsamlı bir makinedir.Uzun demirleri ve diğer metallleri kesmede kullanılan bu makine fabrikanın olmazsa olmaz makinesidir.",
          ),
        ),
      ],
    );
  }
}

class MachineNameTextContainer extends StatelessWidget {
  const MachineNameTextContainer({
    Key? key,
    required this.machine,
  }) : super(key: key);

  final Machines machine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            machine.title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MachineHeadImageContiner extends StatelessWidget {
  const MachineHeadImageContiner({
    Key? key,
    required this.size,
    required this.machine,
  }) : super(key: key);

  final Size size;
  final Machines machine;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 160,
        decoration: const BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )),
        width: size.width,
        child: Image.asset(
          machine.imagePath!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class CustomCircularPercentIndicator extends StatelessWidget {
  final String text;
  final double percent;
  final String imagePath;
  const CustomCircularPercentIndicator({
    Key? key,
    required this.text,
    required this.percent,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        CircularPercentIndicator(
          radius: 45,
          lineWidth: 8.0,
          animation: true,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.red,
          backgroundColor: Colors.grey,
          center: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 35.0,
            child: Text(
              "%$percent",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAutoSizeText extends StatelessWidget {
  final String contentText;
  const CustomAutoSizeText({
    Key? key,
    required this.contentText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 300.0,
            maxWidth: 300.0,
            minHeight: 30.0,
            maxHeight: 100.0,
          ),
          child: AutoSizeText(
            contentText,
            //stepGranularity: 30,
            minFontSize: 15,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 7,
          ),
        ),
      ),
    );
  }
}
