import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AppColors.dart';

class CustomCircularIcon extends StatelessWidget {
  const CustomCircularIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
  Navigator.of(context).pop();
},
        child: const CircleAvatar(
          backgroundColor: AppColors.logoblueColor,
          radius: 20,
          child: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
