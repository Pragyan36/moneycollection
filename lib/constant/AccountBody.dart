import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';

class AccountTableBodyRow extends StatefulWidget {
  final int indexxx;
  final VoidCallback ontap;

  final String accountno;
  final String type;
  final String id;
  final String name;
  final String mobile;
  final String depositcode;

  const AccountTableBodyRow({
    super.key,
    required this.indexxx,
    required this.accountno,
    required this.type,
    required this.id,
    required this.name,
    required this.mobile,
    required this.ontap,
    required this.depositcode,
  });

  @override
  State<AccountTableBodyRow> createState() => _AccountTableBodyRowState();
}

class _AccountTableBodyRowState extends State<AccountTableBodyRow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Column(
        children: [
          SizedBox(
            // height: 50.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Cell(
                    label: widget.accountno,
                  ),
                  const Div(),
                  Cell(
                    label: widget.type,
                  ),
                  const Div(),
                  Cell(
                    label: widget.id,
                  ),
                  const Div(),
                  Cell(
                    label: widget.name,
                  ),
                  const Div(),
                  Cell(
                    label: widget.mobile,
                  ),
                  const Div(),
                  Cell(
                    label: widget.depositcode,
                  ),
                ],
              ),
            ),
          ),
          const Horizentaldiv(),
        ],
      ),
    );
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
      thickness: 2,
      color: AppColors.greyColor,
    );
  }
}

class Cell extends StatefulWidget {
  final String label;
  const Cell({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
