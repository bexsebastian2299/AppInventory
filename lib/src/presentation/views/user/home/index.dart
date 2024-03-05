import 'package:bexpicking_app/src/locator.dart';
import 'package:bexpicking_app/src/presentation/views/packing/index.dart';
import 'package:bexpicking_app/src/presentation/views/picking/index.dart';
import 'package:bexpicking_app/src/presentation/widgets/picking_packing_cards.dart';
import 'package:bexpicking_app/src/services/navigation.dart';
import 'package:bexpicking_app/src/services/storage.dart';
import 'package:bexpicking_app/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';


final LocalStorageService _storageService = locator<LocalStorageService>();
// final NavigationService _navigationService = locator<NavigationService>();
//esta es la pantalla inicial despues de loguearse completamente
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppbar(),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => PickingView())
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.grey.withOpacity(0.6),
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
                      const Text('Picking', style: TextStyle(fontSize: 14),maxLines: 2,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => PackingView())
              );
            } ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: Colors.grey.withOpacity(0.6),
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
                      const Text('Packing', style: TextStyle(fontSize: 14),)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }

  AppBar buildAppbar() => AppBar(
    title: const Text('Menu'),
  );
}