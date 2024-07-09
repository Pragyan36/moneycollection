import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';


class AccountTextField extends StatelessWidget {
 final TextEditingController? controller;
  final String? label;
    final bool? read;

  const AccountTextField({super.key, this.controller,  required this.label,  this.read});
  @override
  Widget build(BuildContext context) {


   return  Container(
      height: 50.h,
    
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color:AppColors.greyColor,
      
        borderRadius: BorderRadius.circular(5.0),
        
      ),
      child: Row(
        
        children: [
          // Left Column (Constant)
          Expanded(
            flex: 2,
            child: Container(
              height: 50.h,
            
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5))),
              padding: const EdgeInsets.only(right: 10.0,left: 10),

              child: Center(
                child:
                 Text(
                  label!, 
                   style: subtitleStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          // Right Column (Editable)
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                readOnly:  read!= null ? true: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'xxxxx-xxxx-xx',
                  hintStyle: subtitleStyle.copyWith(
                  color: Colors.grey,
              
                  ),
                  
                  border: InputBorder.none,
                ),
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

