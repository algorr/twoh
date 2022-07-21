import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../models/machines.dart';

class MachineDetailView extends StatelessWidget {
  final Machines machine;
  const MachineDetailView({Key? key, required this.machine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Doğrama Makinesi",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: size.width,
                    height: 80,
                    child: const CustomAutoSizeText(
                      contentText:
                          "Uzun ve ağır bir makine olan kesme makinesi çok kapsamlı bir makinedir.Uzun demirleri ve diğer metallleri kesmede kullanılan bu makine fabrikanın olmazsa olmaz makinesidir.",
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      CustomCircularPercentIndicator(
                        text: 'WP',
                        imagePath: 'assets/images/1.png',
                        percent: 0.75,
                      ),
                      CustomCircularPercentIndicator(
                          text: 'EP',
                          percent: 0.25,
                          imagePath: 'assets/images/1.png'),
                      CustomCircularPercentIndicator(
                          text: 'LP',
                          percent: 0.73,
                          imagePath: 'assets/images/1.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
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
          lineWidth: 15.0,
          animation: true,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.red,
          backgroundColor: Colors.grey,
          center: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35.0,
            backgroundImage: AssetImage(
              imagePath,
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
      height: 150,
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
        child: AutoSizeText(
          contentText,
          //stepGranularity: 30,
          minFontSize: 15,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 7,
        ),
      ),
    );
  }
}
