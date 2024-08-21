import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bill_controller.dart';

class BillView extends GetView<BillController> {
  const BillView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BillView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BillView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
