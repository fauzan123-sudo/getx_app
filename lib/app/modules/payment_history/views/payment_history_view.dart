import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_history_controller.dart';

class PaymentHistoryView extends GetView<PaymentHistoryController> {
  const PaymentHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
