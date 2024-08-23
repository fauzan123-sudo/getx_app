import 'package:get/get.dart';

mixin PaymentFilter {
  RxInt selectedSiswaWali = (-1).obs;
  RxInt selectedIndex = (-1).obs;
  RxInt selectedCostType = (-1).obs;
  RxList<String> costType = ['semester', 'bulanan', 'tahunan'].obs;

  

  void setSelectedData(int data) {
    selectedIndex.value = data;
  }

  void setSelectedCostType(int data) {
    selectedCostType.value = data;
  }


}
