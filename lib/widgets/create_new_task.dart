import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twoh/models/machines.dart';
import 'package:twoh/viewmodel/bloc/machine_data_bloc.dart';

class CreateNewTask extends StatelessWidget {
  final Machines machines;
  const CreateNewTask({Key? key, required this.machines}) : super(key: key);
  //final String username;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final inputController = TextEditingController();
    return BlocBuilder<MachineDataBloc, MachineDataState>(
      builder: (BuildContext context, state) {
        return Container(
          height: size.height * .4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              const HeadlineText(),
              CreateNewTaskTextField(inputController: inputController),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: CheckboxListTile(
                  title: const Text("Sorun Giderildi"),
                  subtitle: const Text("Manuel Müdahale"),
                  value: machines.isFailure,
                  onChanged: (value) {
                      BlocProvider.of<MachineDataBloc>(context).changeComplition(machines);
                      
                      //BlocProvider.of<MachineDataBloc>(context).add(MachinePatchDataEvent(machines));

                  },
                ),
              ),
              SaveTaskButton(
                inputController: inputController,
                onPressed: (_) async {
                 BlocProvider.of<MachineDataBloc>(context).add(MachineLoadDataEvent());
                  //BlocProvider.of<MachineDataBloc>(context).changeComplition(machines);
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "What task do you want to create?",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    Key? key,
    required this.inputController,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController inputController;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            padding: const EdgeInsets.only(top: 10, right: 50, left: 50),
            textStyle: const TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.pop(context, inputController.text);
          
        },
        child: const Text('Save'));
  }
}

class CreateNewTaskTextField extends StatelessWidget {
  const CreateNewTaskTextField({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: true,
        controller: inputController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.amber)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 3, color: Colors.amber),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 3, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
