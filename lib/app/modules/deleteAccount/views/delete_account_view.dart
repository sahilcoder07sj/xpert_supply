import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delete_account_controller.dart';

class DeleteAccountView extends GetView<DeleteAccountController> {
  const DeleteAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeleteAccountView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeleteAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
