import 'package:flutter/material.dart';


class PackingView extends StatelessWidget {
  const PackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Packing'),
      ),
      body: Column(
        children: [
          Text('Packing cards')
        ],
      ),
    );
  }
}