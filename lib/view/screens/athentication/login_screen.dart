import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:opeec_admin/view/screens/admin_section/admin_panel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controller/utils/constant.dart';
import '../../../controller/utils/my_color.dart';
import '../../custom_widget/custom_elevated_button.dart';
import '../../custom_widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RxBool isPasswordObscure = true.obs;
  final TextEditingController otpCodeTextController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                // Positioned Images
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/png/loginTopRight.png",
                    width: screenWidth * 0.12, // Adjusted for responsiveness
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.5,
                  right: 0,
                  child: Image.asset(
                    "assets/png/topSecondRight.png",
                    width: screenWidth * 0.05, // Adjusted for responsiveness
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/png/bottomImage.png",
                    width: screenWidth * 0.2, // Adjusted for responsiveness
                  ),
                ),
                // Main content
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.1),
                        Image.asset(
                          "assets/png/OPEEC.png",
                          width: screenWidth * 0.15, // Adjusted for responsiveness
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Text(
                          "Login",
                          style: Constant.blackColorLogin.copyWith(
                            fontSize: 20.sp, // Adjusted for responsiveness
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w), // Responsive padding
                          child: CustomTextFormField(
                            prefixIcon: SvgPicture.asset("assets/svg/emailIcon.svg"),
                            hintText: 'Your email address',
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Obx(
                              () => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.w), // Responsive padding
                            child: CustomTextFormField(
                              prefixIcon: SvgPicture.asset("assets/svg/passwordIcon.svg"),
                              hintText: 'Your password',
                              obscureText: isPasswordObscure.value,
                              suffixIcon: GestureDetector(
                                onTap: togglePasswordVisibility,
                                child: SvgPicture.asset(
                                  isPasswordObscure.value
                                      ? "assets/svg/eye.svg"
                                      : "assets/svg/closeEye.svg",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 29.w), // Responsive padding
                            child: GestureDetector(
                              onTap: () {
                                showForgotPasswordDialog(context);
                              },
                              child: Text(
                                "Forgot password",
                                style: Constant.textForgotOrange.copyWith(
                                  fontSize: 12.sp, // Adjusted for responsiveness
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w), // Responsive padding
                            child: CustomElevatedButton(
                              text: "Login",
                              onPressed: () {
                                Get.to(()=>const AdminPanel());

                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.05),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showForgotPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.white,
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
              SizedBox(height: 5.h,),
              Text("Reset Your Password", style: Constant.blackColorResetA),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Enter your email and we'll send you a link to reset your\n password.",
                style: Constant.textWithBlackA,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 400.px, // Adjust this width according to your requirement
                child: CustomTextFormField(
                  prefixIcon: SvgPicture.asset("assets/svg/emailIcon.svg"),
                  hintText: 'Your email address',
                ),
              ),
            ],
          ),
          actions: [SizedBox(height: 1.h,),
            Center(
              child: CustomElevatedButton(
                width: 400.px, // Adjust the button width as needed
                text: "Next",
                onPressed: () {
                  verificationDialog(context);
                },
              ),
            ),
            SizedBox(height: 8.h,width: 8.h,)
          ],
        );
      },
    );
  }
  void verificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.white,
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
              SizedBox(height: 5.h,),
              Text("Enter the code", style: Constant.blackColorResetA),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "We have just sent you a 4-digit code to ",
                style: Constant.textWithBlackA,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h,),
              Text(
                "example@gmail.com ",
                style: Constant.textWithOrangeA,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 4.w),
                child: PinCodeTextField(
                  controller: otpCodeTextController,
                  onCompleted: (v) {
                    otpCodeTextController.text = v;
                  },
                  length: 4,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  cursorColor: MyColor.orangeColor,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 52,
                    fieldWidth: 52,
                    inactiveColor: MyColor.greyColor,
                    selectedColor: MyColor.orangeColor,
                    activeColor: MyColor.orangeColor,
                    borderWidth: 0,
                  ),
                  animationDuration: const Duration(milliseconds: 200),
                  onChanged: (value) {
                    log(value);
                  },
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                  textStyle: const TextStyle(color:MyColor.blackColor),
                ),
              ),
            ],
          ),
          actions: [SizedBox(height: 10.h,),
            Center(
              child: CustomElevatedButton(
                width: 400.px, // Adjust the button width as needed
                text: "Next",
                onPressed: () {
                  createNewPassword(context);           },
              ),
            ),
            SizedBox(height: 8.h,width: 8.h,)
          ],
        );
      },
    );
  }
  void createNewPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.white,
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
              SizedBox(height: 5.h,),
              Text("Create a new password", style: Constant.blackColorResetA),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Your new password must be different\n from previous used passwords.",
                style: Constant.textWithBlackA,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 4.h),
              Obx(
                    () => SizedBox(width: 400.px,
                      child: CustomTextFormField(
                        prefixIcon: SvgPicture.asset("assets/svg/passwordIcon.svg"),
                        hintText: 'Your password',
                        obscureText: isPasswordObscure.value,
                        suffixIcon: GestureDetector(
                          onTap: togglePasswordVisibility,
                          child: SvgPicture.asset(
                            isPasswordObscure.value
                                ? "assets/svg/eye.svg"
                                : "assets/svg/closeEye.svg",
                          ),
                        ),
                      ),
                    ),
              ),

              SizedBox(height: 2.h),
              Obx(
                    () => SizedBox(width: 400.px,
                      child: CustomTextFormField(
                        prefixIcon: SvgPicture.asset("assets/svg/passwordIcon.svg"),
                        hintText: 'Your password',
                        obscureText: isPasswordObscure.value,
                        suffixIcon: GestureDetector(
                          onTap: togglePasswordVisibility,
                          child: SvgPicture.asset(
                            isPasswordObscure.value
                                ? "assets/svg/eye.svg"
                                : "assets/svg/closeEye.svg",
                          ),
                        ),
                      ),
                    ),
              ),
            ],
          ),
          actions: [SizedBox(height: 4.h,),
            Center(
              child: CustomElevatedButton(
                width: 400.px, // Adjust the button width as needed
                text: "Next",
                onPressed: () {
                },
              ),
            ),
            SizedBox(height: 8.h,width: 8.h,)
          ],
        );
      },
    );
  }
}
