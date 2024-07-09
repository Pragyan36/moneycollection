
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:provider/provider.dart';


class CustomDropdownButton extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final Widget? hint;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, theme, child) {
      return Container(
        color:AppColors.greyColor ,
        child: DropdownButtonFormField(
          items: items,
          onChanged: onChanged,
          value: value,
          hint: hint,
          decoration: InputDecoration(
            
            // fillColor: Colors.grey,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryBlack,
              fontSize: 14.sp,
            ),
            suffixIconColor: AppColors.primaryBlack,
            prefixIconColor: AppColors.primaryBlack,
            iconColor: AppColors.primaryBlack,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              // borderSide: const BorderSide(
              //   color: AppColors.primaryBlack,
              // ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: const BorderSide(
                color: AppColors.primaryBlack,
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
            contentPadding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
            ),
          ),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.currentTheme == lightTheme
                ? AppColors.primaryBrown
                : Colors.grey,
            // color: AppColors.primaryBrown,
            fontSize: 14.sp,
          ),
        ),
      );
    });
  }
}


