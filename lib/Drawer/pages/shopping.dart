import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        centerTitle: true,
        backgroundColor: Color(0xff22222C),
      ),
    );
  }
}