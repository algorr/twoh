import 'package:flutter/material.dart';

class JustImage extends StatelessWidget {
  final String imageUrl;
  final Color color;
  const JustImage({Key? key, required this.imageUrl, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
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
                     BoxShadow(
                      color: color,
                      offset: const Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: 
                       Image.asset(imageUrl,fit: BoxFit.fill,),
                ),
              ),
            );
  }
}