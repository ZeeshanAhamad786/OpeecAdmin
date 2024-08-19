import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controller/utils/my_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: MyColor.orangeColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12.px, fontWeight: FontWeight.w400, color: MyColor.blackColor2),
        contentPadding: EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44),
          borderSide: BorderSide(color: MyColor.orangeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44),
          borderSide: BorderSide(color: MyColor.greyColor),
        ),
        prefixIcon: prefixIcon != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(width: .2.w,),
            Transform.translate(offset: const Offset(5, 0),
                child: Transform.scale(scale: 0.7, child: prefixIcon)),
            Container(
              height: 24.px,
              width: 1, // Thin vertical line
              color: MyColor.greyColor, // Line color
              margin: EdgeInsets.symmetric(horizontal: 8.px),
            ),

          ],
        )
            : null,
        suffixIcon: GestureDetector(
          onTap: onSuffixIconPressed,
          child: Transform.scale(scale: 0.5, child: suffixIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(44),
        ),
      ),
    );
  }
}
