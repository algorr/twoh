import 'package:flutter/material.dart';

class CreateNewTask extends StatelessWidget {
  const CreateNewTask({Key? key}) : super(key: key);
  //final String username;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final inputController = TextEditingController();
    return Container(
      height: size.height * .2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "What task do you want to create?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(width: 3, color: Colors.amber),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  padding: const EdgeInsets.only(top: 10, right: 50, left: 50),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.pop(context, inputController.text);
              },
              child: const Text('Save'))
        ],
      ),
    );
  }
}
