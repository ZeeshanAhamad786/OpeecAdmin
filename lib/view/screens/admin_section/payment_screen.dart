import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widget/custom_elevated_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  RxBool isEditing = false.obs;
  TextEditingController secretKeyController = TextEditingController(text: "***************************");

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: MyColor.dashboardColorA,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.px),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.only(left: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text("Pricing", style: Constant.termsConditionsAdmin),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.px),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Stripe Payment",
                                style: Constant.orangeColor1PricingAdmin,
                              ),
                              GestureDetector(
                                onTap: () {
                                  isEditing.value = true;
                                },
                                child: Text(
                                  "Edit",
                                  style: Constant.pricingEditAdmin,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Text("Secret Key", style: Constant.secretKeyAdmin),
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 3.w),
                          margin: EdgeInsets.only(left: 7.w, right: 25.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.px),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(0, 2), blurRadius: 12, spreadRadius: 0)
                              ],
                              color: Colors.white),
                          child: isEditing.value
                              ? TextFormField(
                            controller: secretKeyController,
                            style: Constant.secretKeyTextAdmin,
                            decoration: InputDecoration(prefixIcon: SvgPicture.asset(""),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              border: InputBorder.none,
                            ),
                          )
                              : Text(
                            "***************************",
                            style: Constant.secretKeyTextAdmin,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        if (isEditing.value)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: CustomElevatedButton(width: 20.w,
                                text: "Update", onPressed: () {}),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void pricingEditDialogBox(BuildContext context) {
    // Define TextEditingController to capture user input
    TextEditingController insuranceController = TextEditingController(text: "7");
    TextEditingController platformController = TextEditingController(text: "2");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Pricing",
                      style: Constant.dialogPricingAdmin,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog when the cancel icon is clicked
                    },
                    child: SvgPicture.asset(
                      "assets/svg/cancel.svg",
                      height: 24.px,
                      width: 24.px,
                    ),
                  ),
                ],
              ),
              SizedBox(height: .5.h),
              const Divider(color: MyColor.orangeColor1, thickness: 1),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Insurance Fee",
                          style: Constant.blackColorPricingAdmin,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.px),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 24,
                                spreadRadius: 0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 80.px,
                                  child: TextFormField(
                                    controller: insuranceController,
                                    style: Constant.pricingTextAdmin,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(right: 8.px), // Add padding to the right
                                      suffix: Text(
                                        "%",
                                        style: Constant.pricingTextAdmin,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Platform Fee",
                          style: Constant.blackColorPricingAdmin,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.px),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 24,
                                spreadRadius: 0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: platformController,
                                  style: Constant.pricingTextAdmin,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(right: 8.px), // Add padding to the right
                                    suffix: Text(
                                      "%",
                                      style: Constant.pricingTextAdmin,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            SizedBox(height: 1.h),
            Center(
              child: CustomElevatedButton(
                width: 220.px, // Adjust the button width as needed
                text: "Update",
                onPressed: () {
                  // Add your update logic here, for example, you can print the values:
                  print('Insurance Fee: ${insuranceController.text}%');
                  print('Platform Fee: ${platformController.text}%');
                  Navigator.of(context).pop(); // Close the dialog after updating
                },
              ),
            ),
            SizedBox(height: 8.h, width: 8.h),
          ],
        );
      },
    );
  }
}
