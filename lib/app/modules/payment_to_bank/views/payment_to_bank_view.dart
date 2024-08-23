import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_to_bank_controller.dart';

class PaymentToBankView extends GetView<PaymentToBankController> {
  const PaymentToBankView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentToBankView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentToBankView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
