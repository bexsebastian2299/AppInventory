import 'package:flutter/material.dart';


class PickingPackingCards extends StatelessWidget {
  const PickingPackingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: (){
              print('Ir a picking');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.deepOrange.withOpacity(0.6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 20,)
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40),
                        child: const Icon(Icons.barcode_reader, size: 70,),
                      ),
                      const Divider(),
                      const Text('Picking', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Ir a packing');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.deepOrange.withOpacity(0.6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 20,),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(),
                        child: const Icon(Icons.barcode_reader),
                      ),
                      const Divider(),
                      const Text('Packing', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}