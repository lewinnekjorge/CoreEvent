import 'package:core_event/domain/controller/newstatus.dart';
import 'package:core_event/domain/models/user_status.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublishDialog extends StatefulWidget {
  //final StatusManager manager;

  const PublishDialog({Key? key}) : super(key: key);

  @override
  createState() => _State();
}

class _State extends State<PublishDialog> {
  //late AuthController controller;
  StatusController estadocontrolador = Get.find();
  late bool _buttonDisabled;
  late TextEditingController stateController;
  //dynamic contenido = ''.obs;
  @override
  void initState() {
    super.initState();
    //controller = Get.find<AuthController>();
    _buttonDisabled = false;
    stateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Publicar Estado",
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: stateController,
                keyboardType: TextInputType.multiline,
                // dynamic text lines
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Estado',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text("Publicar"),
                    onPressed: _buttonDisabled
                        ? null
                        : () {
                            estadocontrolador.addstatusmodel(UserStatus(
                                message: stateController.text,
                                name: 'Usuario',
                                picUrl:
                                    'https://uifaces.co/our-content/donated/gPZwCbdS.jpg',
                                email: ''));
                            //   // widget.manager.sendStatus(status).then(
                            //   //       (value) => Get.back(),
                            //   //);
                            // });
                            Get.back();
                          },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
