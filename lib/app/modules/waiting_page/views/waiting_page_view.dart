import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/waiting_page_controller.dart';

class WaitingPageView extends GetView<WaitingPageController> {
  const WaitingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WaitingPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'WaitingPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
