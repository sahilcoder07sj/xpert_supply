import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/quate_controller.dart';

class QuateView extends GetView<QuateController> {
  const QuateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'QuateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
