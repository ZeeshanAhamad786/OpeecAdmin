import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:opeec_admin/controller/utils/my_color.dart';
import '../../../controller/utils/constant.dart';
import '../../custom_widget/custom_elevated_button.dart';
import '../../custom_widget/custom_textfield.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({super.key});

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "App pricing model",
                                style: Constant.blackColorPricingAdmin,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.px),
                                    side: const BorderSide(color: MyColor.pricingEditAdmin),
                                  ),
                                ),
                                onPressed: () {
                                  pricingEditDialogBox(context);
                                },
                                child: Text(
                                  "Edit",
                                  style: Constant.pricingEditAdmin,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: .5.h),
                        const Divider(color: MyColor.orangeColor1, thickness: 1),
                        SizedBox(height: 15.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 25.w),
                          child: Row(
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
                                      child: Text(
                                        "7  %",
                                        style: Constant.pricingTextAdmin,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(width: 2.w),
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
                                      child: Text(
                                        "2  %",
                                        style: Constant.pricingTextAdmin,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                                child: SizedBox(width:80.px,
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
