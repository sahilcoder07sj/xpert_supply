import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_edit_category_controller.dart';

class AddEditCategoryView extends GetView<AddEditCategoryController> {
  const AddEditCategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddEditCategoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddEditCategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
