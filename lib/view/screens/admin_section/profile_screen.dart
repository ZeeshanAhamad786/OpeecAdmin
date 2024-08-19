import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opeec_admin/view/custom_widget/custom_about_textfield.dart';
import 'package:opeec_admin/view/custom_widget/custom_elevated_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widget/custom_textfield.dart';
import '../../custom_widget/custom_textform_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return
      Container(
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
                Text("Profile", style: Constant.termsConditionsAdmin),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // padding: EdgeInsets.symmetric(vertical: 3.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.px),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                        decoration: BoxDecoration(boxShadow: [
                           BoxShadow(color: Colors.black.withOpacity(0.1),
                               blurRadius: 12,spreadRadius: 0,offset: Offset(0, 0))
                        ],color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left Column with Profile Information
                            Expanded(
                              flex: 3, // Adjust flex as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage:
                                        AssetImage("assets/png/profileImage.png"),
                                        radius: 40,
                                      ),
                                      SizedBox(width: 3.w),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mohsin",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "CEO / Co-Founder",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  const Text(
                                    """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.""",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            // Vertical Divider
                          Container(
                            height: 200,width: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 4.w,),
                            Expanded(
                              flex: 2, // Adjust flex as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Row(
                                    children: [
                                      Text(
                                        "Email:",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        "zeeshan@gmail.com",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Text(
                                        "Mobile:",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 2.w),

                                      Text(
                                        " 003243549",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Text(
                                        "Age:",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 3.5.w),

                                      Text(
                                        "40",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2.h),
                                  Row(
                                    children: [
                                      Text(
                                        "Location:",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(width: 1.w),
                                      const Text(
                                        "Lahore",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  Align(alignment:Alignment.centerRight ,
                                    child: CustomElevatedButtonSmall(width: 100.px,
                                        text: "Edit Info", onPressed: (){
                                          editProfileDialog(context);
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
  void editProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog when the cancel icon is clicked
                  },
                  child: SvgPicture.asset("assets/svg/cancel.svg"),
                ),
              ),
              SizedBox(height: 2.h),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/png/profileImage.png"),
                radius: 40,
              ),
            ],
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              // maxWidth: 60.w, // Adjust this to minimize the width
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.5.w),
                    child: const Text("Name"),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const EquipmentCustomField(),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.5.w),
                    child: const Text("Designation"),
                  ),
                  SizedBox(height: 1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const EquipmentCustomField(),
                  ),
                  SizedBox(height: 2.h),
                  const Text("About"),
                  SizedBox(height: 1.h),
                  const CustomAboutTextFormField(),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email"),
                            SizedBox(height: 1.h),
                            const EquipmentCustomField(),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w), // Add space between columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Mobile"),
                            SizedBox(height: 1.h),
                            const EquipmentCustomField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Age"),
                            SizedBox(height: 1.h),
                            const EquipmentCustomField(),
                          ],
                        ),
                      ),
                      SizedBox(width: 4.w), // Add space between columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Location"),
                            SizedBox(height: 1.h),
                            const EquipmentCustomField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Center(
                child: CustomElevatedButton(
                  width: 40.w, // Adjust the button width as needed
                  text: "Update",
                  onPressed: () {
                    // verificationDialog(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        );
      },
    );
  }

}
