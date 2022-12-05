import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: controller.pages,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTab,
          backgroundColor: Colors.grey.shade100,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Semua Data',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.password),
                label: 'Reset Password',
                backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
