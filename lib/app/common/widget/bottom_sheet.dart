import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/button_reusable.dart';
import 'package:getx_app/app/common/widget/color_custom.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/data/model/home/main_home_response.dart';
import 'package:getx_app/app/data/model/payment/history/payment_history.dart';
import 'package:getx_app/app/modules/home/controllers/home_controller.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class LeonBottomSheet extends StatelessWidget {
  const LeonBottomSheet({
    super.key,
    this.cost,
    this.label,
    this.statusString,
    this.newDate,
    this.newTime,
    this.newItem,
    this.details,
  });
  final String? cost;
  final int? label;
  final String? statusString;
  final String? newDate;
  final String? newTime;
  final RiwayatPembayaran? newItem;
  final Detail? details;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            controller: ScrollController(),
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(AppInteger.gSpace10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 54,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: const Column(
                          children: [],
                        ),
                      ),
                    ),
                    const LeonSizeBox10(),
                    Center(
                      child: Text('Detail Pembayaran',
                          style: LeonTextStyles.poppins14BoldPrimary()),
                    ),
                    const LeonSizeBox10(),
                    const Divider(
                      height: 0.5,
                      thickness: 0.5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    const LeonSizeBox10(),

                    // Section 1
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('TANGGAL',
                                  style: LeonTextStyles.poppins12BoldMuted()),
                              Text(newDate ?? '',
                                  style:
                                      LeonTextStyles.poppins10RegularBlack()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('JAM',
                                  style: LeonTextStyles.poppins12BoldMuted()),
                              Text(newTime ?? '',
                                  style:
                                      LeonTextStyles.poppins10RegularBlack()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const LeonSizeBox10(),
                    // Section 2
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('TOTAL',
                                  style: LeonTextStyles.poppins12BoldMuted()),
                              Text(cost ?? '',
                                  style:
                                      LeonTextStyles.poppins10RegularDanger()),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('STATUS',
                                  style: LeonTextStyles.poppins12BoldMuted()),
                              Container(
                                decoration: BoxDecoration(
                                    color: getStatusColor(label),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppInteger.gSpace5),
                                child: Text(statusString ?? '',
                                    style: LeonTextStyles.poppins8BoldWhite()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const LeonSizeBox10(),
                    const Divider(
                      height: 0.5,
                      thickness: 0.5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    const LeonSizeBox10(),
                    ListView.separated(
                      itemCount: newItem?.detail?.length ?? 0,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 5,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var biayaItem = newItem!.detail![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(biayaItem.biaya!,
                                style: LeonTextStyles.poppins10RegularBlack()),
                            Text(biayaItem.nominal!.toString(),
                                style: LeonTextStyles.poppins10SemiBoldBlack()),
                          ],
                        );
                      },
                    ),
                    const LeonSizeBox10(),

                    if (label == 0 || label == 2)
                      LeonButtonBorder(
                        borderColor: AppColors.bgPrimary,
                        buttonColor: AppColors.bgPrimary,
                        onPressed: () {
                          Get.toNamed(Routes.WAITING_PAGE);
                        },
                        buttonText: 'BAYAR',
                        textStyle: LeonTextStyles.poppins12BoldWhite(),
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
