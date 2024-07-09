// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';


Future<dynamic> customShowDialog({
  required BuildContext context,
  required String title,
  required String content,
  required void Function()? onYesPressed,
  required void Function()? onNoPressed,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: AppColors.primaryColor,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: AppColors.primaryBrown,
          ),
        ),
        actions: [
          TextButton(
            onPressed: onNoPressed,
            child: Text(
              "No",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.primaryBrown,
              ),
            ),
          ),
          TextButton(
            onPressed: onYesPressed,
            child: Text(
              "Yes",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14.sp,
                color: AppColors.primaryBrown,
              ),
            ),
          ),
        ],
      );
    },
  );
}
