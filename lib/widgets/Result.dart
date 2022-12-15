import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, 
    required this.result
  }) : super(key: key);

  final List<String> result;

   @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Text(
            result[index],
            style: const TextStyle(
                fontSize: 17, color: Color.fromARGB(255, 63, 63, 63)),
          );
        },
      ),
    );
  }
}
