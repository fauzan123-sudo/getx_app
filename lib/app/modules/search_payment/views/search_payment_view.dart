import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_payment_controller.dart';

class SearchPaymentView extends GetView<SearchPaymentController> {
  const SearchPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPaymentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchPaymentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
