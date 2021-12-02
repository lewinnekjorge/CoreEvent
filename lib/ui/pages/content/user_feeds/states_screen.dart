import 'package:core_event/domain/controllers/newstatus.dart';
import 'package:core_event/ui/pages/content/user_feeds/widgets/newcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/state_card.dart';

class StatesScreen extends StatefulWidget {
  // StatesScreen empty constructor
  const StatesScreen({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<StatesScreen> {
  //controladro controller = new controller
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
    return GetX<StatusController>(builder: (statuscontrolador){
      return Stack(
        children: [
          ListView.builder(
            itemCount: statuscontrolador.liststados.length,
            itemBuilder: (context, index) {
              return StateCard(
                index: index,
                title: statuscontrolador.liststados[index].title,//'Prueba',
                content: statuscontrolador.liststados[index].message,//'Lorem ipsum dolor sit amet.',
                picUrl: statuscontrolador.liststados[index].picUrl,//'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
                onChat: () => {},
              );
            },
          ),
        Positioned(
            right: 20,
            bottom: 30,
            child: FloatingActionButton(
              onPressed: () {
                Get.dialog(
                  PublishDialog()
                );
              },
              child: const Icon(Icons.add),
            ))
      ],
    );
    });
    
  }
}