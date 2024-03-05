import 'package:flutter/material.dart';


class PickingView extends StatelessWidget {
  const PickingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Picking'),
      ),
      body: Column(
        children: [
          Text('Batch cards')
        ],
      ),
    );
  }
}