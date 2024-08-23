import 'package:get/get.dart';

import '../modules/bill/bindings/bill_binding.dart';
import '../modules/bill/views/bill_view.dart';
import '../modules/bottom_navigation/bindings/bottom_navigation_binding.dart';
import '../modules/bottom_navigation/views/bottom_navigation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/payment_history/bindings/payment_history_binding.dart';
import '../modules/payment_history/views/payment_history_view.dart';
import '../modules/payment_to_bank/bindings/payment_to_bank_binding.dart';
import '../modules/payment_to_bank/views/payment_to_bank_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../modules/search_payment/bindings/search_payment_binding.dart';
import '../modules/search_payment/views/search_payment_view.dart';
import '../modules/waiting_page/bindings/waiting_page_binding.dart';
import '../modules/waiting_page/views/waiting_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.BILL,
      page: () => const BillView(),
      binding: BillBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => const ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => const BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.WAITING_PAGE,
      page: () => const WaitingPageView(),
      binding: WaitingPageBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_HISTORY,
      page: () => const PaymentHistoryView(),
      binding: PaymentHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_TO_BANK,
      page: () => const PaymentToBankView(),
      binding: PaymentToBankBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAYMENT,
      page: () => const SearchPaymentView(),
      binding: SearchPaymentBinding(),
    ),
  ];
}
