import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event/data/model/record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class FirebaseController extends GetxController {
  final _records = <Record>[].obs;
  final CollectionReference baby =
      FirebaseFirestore.instance.collection('Feeds');
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Feeds').snapshots();
  late StreamSubscription<Object?> streamSubscription;

  suscribeUpdates() async {
    logInfo('suscribeLocationUpdates');
    streamSubscription = _usersStream.listen((event) {
      logInfo('Got new item from fireStore');
      _records.clear();
      for (var element in event.docs) {
        _records.add(Record.fromSnapshot(element));
      }
      //print('Got ${_records.length}');
    });
  }

  unsuscribeUpdates() {
    streamSubscription.cancel();
  }

  List<Record> get entries => _records;

  addEntry(name) {
    baby
        .add({'name': name, 'votes': 0})
        .then((value) => Get.snackbar(
              "Feed Agregado",
              'OK',
              icon: const Icon(Icons.person, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
            ))
        .catchError((onError) => Get.snackbar(
              "Falla en agregar un Feed $onError",
              'OK',
              icon: const Icon(Icons.person, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
            ));
  }

  updateEntry(Record record) {
    record.reference.update({'votes': record.votes + 1});
  }

  deleteEntry(Record record) {
    record.reference.delete();
  }
}
