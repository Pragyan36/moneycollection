
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/Customdropdown.dart';

import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:moneycollection/provider/theme/theme.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:provider/provider.dart';


class DateDropdownEnglish extends StatefulWidget {
  const DateDropdownEnglish({super.key});
  

  @override
  State<StatefulWidget> createState() => _DateDropdownEnglishState();
}

class Month {
  final int id;
  final String nameEnglish;
  final String nameNepali;

  Month(
    this.id,
    this.nameEnglish,
    this.nameNepali,
  );
}

class _DateDropdownEnglishState extends State<DateDropdownEnglish> {
  List<Month> englishMonthsList = [
    Month(1, 'January', 'बैशाख'),
    Month(2, 'February', 'जेष्ठ'),
    Month(3, 'March', 'आषाढ'),
    Month(4, 'April', 'श्रावण'),
    Month(5, 'May', 'भाद्र'),
    Month(6, 'June', 'आश्वयुज'),
    Month(7, 'July', 'कार्तिक'),
    Month(8, 'August', 'मंसिर'),
    Month(9, 'September', 'पुष'),
    Month(10, 'October', 'माघ'),
    Month(11, 'November', 'फागुन'),
    Month(12, 'December', 'चैत्र'),
  ];
  List<int> englishDaysList = List.generate(
    32,
    (index) => index + 1,
  );
  List<int> yearsList = [];
  Month? selectedMonth;
  int selectedMonthId = 1;
  int selectedDay = 1;
  int selectedYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    // Populate the list with years from the current year to 100 years ago
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= currentYear - 100; i--) {
      yearsList.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoanStateProvider>(
      builder: (context, dateState, child) {
        return Consumer<ThemeModel>(builder: (context, theme, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomDropdownButton(
                      value: selectedMonth,
                      hint: Text(
                        englishMonthsList.first.nameEnglish,
                      ),
                      items: englishMonthsList.map((Month month) {
                        return DropdownMenuItem<Month>(
                          value: month,
                          child: Text(
                            month.nameEnglish,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedMonth = selected;
                          dateState.monthEnglish = selectedMonth!.id;
                          selectedMonthId = selectedMonth!.id;
                          dateState.yearNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().year;
                           dateState.monthNeplali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().month;
                           dateState.dayNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().day;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomDropdownButton(
                      value: selectedDay,
                      items: englishDaysList.map((int day) {
                        return DropdownMenuItem<int>(
                          value: day,
                          child: Text(
                            '$day',
                          ),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedDay = selected!;
                          dateState.dayEnglish = selectedDay;
                          dateState.yearNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().year;
                           dateState.monthNeplali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().month;
                           dateState.dayNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().day;
                           print("create day : ${dateState.yearEnglish}");
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomDropdownButton(
                      value: selectedYear,
                      items: yearsList.map((int year) {
                        return DropdownMenuItem<int>(
                          value: year,
                          child: Text('$year'),
                        );
                      }).toList(),
                      onChanged: (selected) {
                        setState(() {
                          selectedYear = selected!;
                          dateState.yearEnglish = selectedYear;
                           dateState.yearNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().year;
                           dateState.monthNeplali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().month;
                           dateState.dayNepali = DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().day;
                        });
                      },
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(
              //   "This is nepali date  :${DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().year} - ${DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().month} - ${DateTime(selectedYear, selectedMonthId, selectedDay).toNepaliDateTime().day} BS",
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     color: theme.currentTheme == lightTheme
              //         ? AppColors.primaryBrown
              //         : Colors.white,
              //     fontSize: 14.sp,
              //   ),
              // ),
            ],
          );
        });
      },
    );
  }
}

