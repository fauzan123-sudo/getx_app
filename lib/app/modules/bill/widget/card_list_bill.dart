import 'package:flutter/material.dart';
import 'package:getx_app/app/common/constan/colors.dart';
import 'package:getx_app/app/common/constan/integer.dart';
import 'package:getx_app/app/common/widget/dash.dart';
import 'package:getx_app/app/common/widget/sizebox.dart';
import 'package:getx_app/app/common/widget/text-style-provider.dart';
import 'package:getx_app/app/data/model/bill/model_tagihan.dart';


class LeonCardBill extends StatelessWidget {
  const LeonCardBill({
    super.key,
    required this.date,
    required this.tagihanList,
  });

  final String date;
  final List<ListTagihan> tagihanList;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.bgPrimary),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      shadowColor: Colors.black,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppInteger.gSpace10),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppInteger.gSpace10),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: AppColors.bgPrimary, width: 5),
              right: BorderSide(color: AppColors.bgPrimary, width: 1),
              top: BorderSide(color: AppColors.bgPrimary, width: 1),
              bottom: BorderSide(color: AppColors.bgPrimary, width: 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(date, style: LeonTextStyles.inter10BoldPrimary()),
                  // Container(
                  //   decoration: const BoxDecoration(
                  //     color: Colors.red,
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //   ),
                  //   padding: const EdgeInsets.symmetric(horizontal: 5),
                  //   child: Text('label',
                  //       style: LeonTextStyles.poppins8BoldWhite()),
                  // ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tagihanList.length,
                itemBuilder: (context, index) {
                  var item = tagihanList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LeonSizeBox10(),
                      const LeonDash(),
                      const LeonSizeBox10(),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 5),
                      //   child: Text(item.biayaId ?? '',
                      //       style: LeonTextStyles.poppins8BoldWhite()),
                      // ),
                      Text(item.namaBiaya ?? '',
                          style: LeonTextStyles.poppins10SemiBoldBlack()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Jatuh Tempo : ${item.tanggalJatuhTempo}',
                              style: LeonTextStyles.poppins10MediumBlack()),
                          Text(item.nominal.toString(),
                              style: LeonTextStyles.poppins10BoldDanger()),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
