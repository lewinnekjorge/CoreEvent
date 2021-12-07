import 'package:flutter/material.dart';
import 'widgets/state_card.dart';

class StatesScreen extends StatefulWidget {
  // StatesScreen empty constructor
  const StatesScreen({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  //final items = List<String>.generate(8, (i) => "Item $i");
  // try {
  //   print(items);
  //   bool pruebita = true;
  // } catch (e) {
  //   bool pruebita = false;
  // }
  // if (bool pruebita == true){
  //   var items = [];
  // }
  final items = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return StateCard(
              title: 'Prueba',
              content: 'Lorem ipsum dolor sit amet.',
              picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
              onChat: () => {},
              index: 0,
            );
          },
        ),
        Positioned(
            right: 20,
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  (items.add('1'));
                });
              },
              child: const Icon(Icons.add),
            ))
      ],
    );
    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return StateCard(
    //       title: 'Prueba',
    //       content: 'Lorem ipsum dolor sit amet.',
    //       picUrl: 'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
    //       onChat: () => {},
    //     );
    //   },
    // );
  }
}
// Future<void> addcard(BuildContext context) async {
//     getName(context).then((value) {
//       _State.addEntry(value);
//       });
//     }

// Future<String> getName(BuildContext context) async {
//     String? result = await prompt(
//       context,
//       title: Text('Adding a baby'),
//       initialValue: '',
//       textOK: Text('Ok'),
//       textCancel: Text('Cancel'),
//       hintText: 'Baby name',
//       minLines: 1,
//       autoFocus: true,
//       obscureText: false,
//       textCapitalization: TextCapitalization.words,
//     );
//     if (result != null) {
//       return Future.value(result);
//     }
//     return Future.error('cancel');
//   }
// }