import 'package:core_event/ui/pages/content/user_feeds/widgets/newcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/controllers/newstatus.dart';
import 'ui/app.dart';
import 'ui/pages/content_start.dart';

void main() {
  Get.lazyPut<InicioWidget>(() => const InicioWidget(title: 'main'));
  Get.put(StatusController());
  runApp(const App());
}
