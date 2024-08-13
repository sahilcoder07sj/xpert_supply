import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/upload_file_controller.dart';

class UploadFileView extends GetView<UploadFileController> {
  const UploadFileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UploadFileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UploadFileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
