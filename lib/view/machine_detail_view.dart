import 'package:flutter/material.dart';
import '../models/machines.dart';

class MachineDetailView extends StatelessWidget {
  final Machines machine;
  const MachineDetailView({Key? key, required this.machine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/1.png"),
            Text(machine.id.toString()),
            Text(machine.title.toString())
          ],
        ),
      ),
    );
  }
}
