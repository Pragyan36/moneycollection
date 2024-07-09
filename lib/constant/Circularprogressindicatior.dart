// ignore: file_names
import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AppColors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.logoblueColor.withOpacity(0.3),
        valueColor: const AlwaysStoppedAnimation(
          AppColors.logoblueColor,
        )
      ),
    );
  }
}
