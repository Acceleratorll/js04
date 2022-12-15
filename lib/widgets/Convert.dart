import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key? key, required this.konvertHandler}) : super(key: key);
  final Function() konvertHandler;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: konvertHandler,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.blue,
      ),
      child: const Text('Konversi Suhu'),
    );
  }
}
