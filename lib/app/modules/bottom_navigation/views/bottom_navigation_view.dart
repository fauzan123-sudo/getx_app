import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/modules/bill/views/bill_view.dart';
import 'package:getx_app/app/modules/home/views/home_view.dart';
import 'package:getx_app/app/modules/payment/views/payment_view.dart';
import 'package:getx_app/app/modules/profile/views/profile_view.dart';
import 'package:getx_app/app/modules/report/views/report_view.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              HomeView(),
              BillView(),
              PaymentView(),
              ReportView(),
              ProfileView(),
            ],
          ),
floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.changeTabIndex(2);  // Navigasi ke tab Payment
          },
          child: const Icon(Icons.payment),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Mengubah lokasi FAB ke centerFloat
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0, // Margin notch lebih besar untuk menghindari overflow
          child: SafeArea( // Menghindari overflow dengan SafeArea
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                if (index != 2) { // Pastikan FAB hanya bekerja untuk tab selain Payment
                  controller.changeTabIndex(index);
                }
              },
              selectedItemColor: Colors.blue, 
              unselectedItemColor: Colors.grey, 
              backgroundColor: Colors.white, 
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Attendance',
                ),
                BottomNavigationBarItem( // Spacer untuk FAB
                  icon: SizedBox.shrink(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.report),
                  label: 'Report',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
