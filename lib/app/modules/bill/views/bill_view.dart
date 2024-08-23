import 'package:flutter/material.dart';
import 'package:getx_app/app/common/widget/handle_empty.dart';
import 'package:getx_app/app/modules/bill/widget/card_list_bill.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/icon.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/constan/strings.dart';
import 'package:getx_app/app/common/widget/appbar_reusable.dart';
import 'package:getx_app/app/common/widget/background_image.dart';
import 'package:getx_app/app/common/widget/cardview_reusable.dart';
import 'package:getx_app/app/common/widget/form_calendar.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/svg_reusable.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/utils/date_formater.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

import '../controllers/bill_controller.dart';

class BillView extends StatefulWidget {
  const BillView({super.key});

  @override
  State<BillView> createState() => _BillViewState();
}

final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

class _BillViewState extends State<BillView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillController>(
        init: BillController(),
        builder: (controller) {
          return SafeArea(
              child: Scaffold(
            appBar: LeonAppBar(
              title: _buildChangeUser(controller),
              leadingAvatar: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1687558246422-e94f0864d467?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                radius: 20,
              ),
              showBackArrow: false,
              actions: [
                LeonSvgNoSize(
                  assetName: AppIcon.iNotification,
                  onTap: () {},
                ),
              ],
            ),
            body: BackgroundImage(
                child: SwipeRefresh.material(
              onRefresh: () async {
                await controller.loadDataTagihan('', '', '');
              },
              stateStream: controller.refreshStateStream,
              children: [
                _myBody(controller),
              ],
            )),
          ));
        });
  }

  Widget _buildChangeUser(BillController controller) {
    return GestureDetector(
      onTap: () {
        controller.showSiswaWaliDialog();
      },
      child: Row(
        children: [
          Obx(() {
            // return Column();
            if (controller.selectedStudent.value != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.selectedStudent.value!.nama!,
                      style: LeonTextStyles.poppins12BoldBlack()),
                  Text(controller.namaWali.value,
                      style: LeonTextStyles.poppins10RegularBlack()),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data Belum ada',
                      style: LeonTextStyles.poppins12BoldBlack()),
                  Text('Data Belum ada',
                      style: LeonTextStyles.poppins10RegularBlack()),
                ],
              );
            }
          }),
          const SizedBox(
            width: 10,
          ),
          LeonSvg(
            assetName: AppIcon.iDownArrow,
            onTap: () {
              controller.showSiswaWaliDialog();
            },
            width: 18,
            height: 18,
          )
        ],
      ),
    );
  }

  Widget _myBody(BillController controller) {
    return Column(
      children: [
        LeonCardBottomShadow(
          width: Get.width,
          color: Colors.white,
          shadowOffset: const Offset(0, 4),
          child: Padding(
            padding: const EdgeInsets.all(AppInteger.gSpace10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(AppString.gBill,
                        style: LeonTextStyles.inter10BoldPrimary()),
                  ],
                ),
                Row(
                  children: [
                    LeonSvgNoSize(
                        assetName: AppIcon.iSearch,
                        onTap: () {
                          // Get.toNamed(Routes.SEARCH_PAYMENT);
                        }),
                    const LeonSizeBox10Width(),
                    InkWell(
                      onTap: () {
                        SideSheet.right(
                            context: context,
                            width: Get.width * 0.7,
                            body: buildSideBar(context, controller, fbKey));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.filter_alt_outlined,
                            size: 24.0,
                          ),
                          Text(AppString.gFilter,
                              style:
                                  LeonTextStyles.poppins8ExtraLightPrimary()),
                        ],
                      ),
                    ),
                    const LeonSizeBox10(),
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildBody(controller),
      ],
    );
  }

  Widget buildSideBar(BuildContext context, BillController controller,
      GlobalKey<FormBuilderState> fbKey) {
    return Column(
      children: [
        Container(
          color: AppColors.greyLight,
          child: Padding(
            padding: const EdgeInsets.all(AppInteger.gSpace10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.gFilter,
                    style: LeonTextStyles.poppins12BoldBlack()),
                IconButton(
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 24.0,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        const LeonSizeBox10(),
        Padding(
          padding: const EdgeInsets.all(AppInteger.gSpace10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LeonSizeBox10(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: AppInteger.gSpace10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.gTypeName,
                      style: LeonTextStyles.poppins10BoldBlack(),
                    ),
                    const LeonSizeBox10(),
                    AutoHeightGridView(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      crossAxisSpacing: AppInteger.gSpace10,
                      mainAxisSpacing: AppInteger.gSpace10,
                      itemCount: controller.costType.length,
                      builder: (context, index) {
                        var item = controller.costType[index];
                        return Obx(() {
                          bool selected =
                              controller.selectedCostType.value == index;
                          return InkWell(
                            onTap: () {
                              controller.setSelectedCostType(index);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: selected
                                          ? Colors.black
                                          : Colors.transparent,
                                      width: 1)),
                              margin: EdgeInsets.zero,
                              color: AppColors.greyLight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(AppInteger.gSpace10),
                                child: Center(
                                  child: Text(item,
                                      style: LeonTextStyles
                                          .poppins10RegularBlack()),
                                ),
                              ),
                            ),
                          );
                        });
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
              const LeonSizeBox10(),
              Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppInteger.gSpace10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.gDate,
                          style: LeonTextStyles.poppins10BoldBlack()),
                      const LeonSizeBox10(),
                      FormBuilder(
                        key: fbKey,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0,
                                    right: 5,
                                    top: AppInteger.gSpace10,
                                    bottom: AppInteger.gSpace10),
                                child: Column(
                                  children: [
                                    paddingForCalendar(context, 'DARI'),
                                    const LeonCalendar(
                                      name: 'dateFrom',
                                      hintText: 'HH/MM/YYYY',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0,
                                    right: 5,
                                    top: AppInteger.gSpace10,
                                    bottom: AppInteger.gSpace10),
                                child: Column(
                                  children: [
                                    paddingForCalendar(context, 'SAMPAI'),
                                    const LeonCalendar(
                                      name: 'dateUntil',
                                      hintText: 'HH/MM/YYYY',
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const LeonSizeBox20()
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppInteger.gSpace10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                fbKey.currentState!.reset();
                                controller.setSelectedData(-1);
                                controller.setSelectedCostType(-1);
                                // controller.setSelectedNominalCost(-1);
                                // controller.setSelectedSchoolYear(-1);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppInteger.gSpace10),
                                    side: const BorderSide(
                                        color: Colors.black, width: 1)),
                                margin: EdgeInsets.zero,
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(AppInteger.gSpace10),
                                  child: Center(
                                    child: Text(AppString.gReset,
                                        style: LeonTextStyles
                                            .poppins10BoldPrimary()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const LeonSizeBox10Width(),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (fbKey.currentState!.saveAndValidate()) {
                                  var dataFrom = fbKey
                                      .currentState!.value['dateFrom']
                                      ?.toString();
                                  var dataUntil = fbKey
                                      .currentState!.value['dateUntil']
                                      ?.toString();

                                  if (dataFrom != null) {
                                    dataFrom = toFormattedDate(dataFrom);
                                  }
                                  if (dataUntil != null) {
                                    dataUntil = toFormattedDate(dataUntil);
                                  }

                                  final int costTypeIndex =
                                      controller.selectedCostType.value;

                                  final String costType = costTypeIndex != -1
                                      ? controller.costType[costTypeIndex]
                                      : '';

                                  controller.loadDataTagihan(
                                      dataUntil, costType, dataFrom);
                                  debugPrint(
                                      'tipe : $costType, Data From: ${dataFrom ?? ''}, Data Until: ${dataUntil ?? ''}');
                                }
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppInteger.gSpace10),
                                    side: const BorderSide(
                                        color: Colors.black, width: 1)),
                                margin: EdgeInsets.zero,
                                color: AppColors.bgPrimary,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.all(AppInteger.gSpace10),
                                  child: Center(
                                    child: Text(AppString.gApply,
                                        style: LeonTextStyles
                                            .poppins10BoldWhite()),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const LeonSizeBox10(),
                    ],
                  ),
                ),
              ),
              const LeonSizeBox10(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBody(BillController controller) {
    return Expanded(
        child: SwipeRefresh.material(
      onRefresh: () async {
        await controller.loadDataTagihan('', '', '');
      },
      stateStream: controller.refreshStateStream,
      children: [
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.dataTagihan.isEmpty) {
            return buildHandleEmptyPayment();
          } else {
            return ListView.separated(
              itemCount: controller.dataTagihan.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = controller.dataTagihan[index];
                return InkWell(
                  child: LeonCardBill(
                    date: item.periode!,
                    tagihanList: item.list!,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          }
        }),
      ],
    ));
  }

  Widget paddingForCalendar(BuildContext context, String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.bgPrimary,
                width: 1.0,
              ),
              top: BorderSide(
                color: AppColors.bgPrimary,
                width: 1.0,
              ),
              right: BorderSide(
                color: AppColors.bgPrimary,
                width: 1.0,
              ),
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.orange),
        child: Center(
          child: Text(
            s,
            style: LeonTextStyles.poppins8BoldBlack(),
          ),
        ),
      ),
    );
  }
}
