import 'package:flutter/material.dart';
import 'package:moneycollection/constant/AppImageDirectory.dart';

class Nodata extends StatelessWidget {
  const Nodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180,
        width: 120,
         
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.nodata),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("No data", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
            ),
          ],
        ),
      
      ),
    );
  }
}