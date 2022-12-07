import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_care_app/app/modules/welcome/controllers/welcome_controller.dart';

class WelcomeNavigation extends GetView<WelcomeController> {
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
                icon: Icon(Icons.quiz),
                label: 'Quiz',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Hasil',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
                backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
