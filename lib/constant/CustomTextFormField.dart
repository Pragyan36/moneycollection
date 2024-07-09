// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labeltext;
  final bool? obstruct;
  final Function(String)? onchanged;
  final String? Function(String?)? validator;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderSide? borderSide;
  final double? width;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fieldcolor;
  final String? hinttext;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final String? label;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final InputBorder? enabledBorder;

  const CustomTextFormField({
    Key? key,
    this.readOnly,
    this.label,
    this.labeltext,
    this.onchanged,
    this.borderSide,
    this.hinttext,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.padding,
    this.fieldcolor,
    this.prefix,
    this.suffix,
    this.height,
    this.width,
    this.textInputType,
    this.obstruct,
    this.controller,
    this.validator,
    this.enabledBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.currentTheme == lightTheme
                    ? AppColors.logoblueColor
                    : Colors.white,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            TextFormField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: theme.currentTheme == lightTheme
                    ? AppColors.primaryBrown
                    : Colors.white,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: readOnly == null ? false : true,
              keyboardType: textInputType,
              validator: validator,
              onChanged: onchanged,
              onTap: onTap,
              obscureText: obstruct ?? false,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: padding,
                prefixIcon: prefixIcon,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.customContainerBorderColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.r),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryRed,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.r),
                  ),
                ),
                enabledBorder: enabledBorder,
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.primaryRed,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.r),
                  ),
                ),
                suffixIcon: suffixIcon,
                suffixIconColor: AppColors.secondaryLightColor,
                hintText: hinttext,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
                labelText: labeltext,
                floatingLabelStyle: const TextStyle(
                  color: AppColors.primaryBrown,
                ),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                isDense: true,
                suffix: suffix,
              ),
            ),
          ],
        ),
      );
    });
  }
}
