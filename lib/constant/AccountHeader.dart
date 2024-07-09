import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';

import 'package:provider/provider.dart';

class AccountTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoanStateProvider>(builder: (context, loanacc, child) {
      return const Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                AccountCell(
                  label: "Acc",
                ),
                Div(),
                AccountCell(
                  label: "Type",
                ),
                Div(),
                AccountCell(
                  label: "ID",
                ),
                Div(),
                AccountCell(
                  label: "Name",
                ),
                Div(),
                AccountCell(
                  label: "Phone",
                ),
                Div(),
                AccountCell(
                  label: "Code",
                ),
              ],
            ),
          ),
          Horizentaldiv()
        ],
      );
    });
  }
}

class Horizentaldiv extends StatelessWidget {
  const Horizentaldiv({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: AppColors.greyColor,
    );
  }
}

class Div extends StatelessWidget {
  const Div({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 1,
      color: AppColors.primaryBlue,
    );
  }
}

class AccountCell extends StatefulWidget {
  final String label;
  const AccountCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<AccountCell> createState() => _AccountCellState();
}

class _AccountCellState extends State<AccountCell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 40.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                widget.label,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
