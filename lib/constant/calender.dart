import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moneycollection/constant/AppColors.dart';
import 'package:moneycollection/constant/Customdropdown.dart';
import 'package:moneycollection/modules/Deposit/DepositForm.dart';
import 'package:moneycollection/provider/controller/deposite_state.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:provider/provider.dart';

class DateConversionExample extends StatefulWidget {
   final bool isSaving;

  const DateConversionExample({super.key, required this.isSaving});
  @override
  _DateConversionExampleState createState() => _DateConversionExampleState();
}

class _DateConversionExampleState extends State<DateConversionExample> {
  String _selectedDateType = 'English';
  DateTime? _selectedEnglishDate;
  picker.NepaliDateTime? _selectedNepaliDate;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController englishController = TextEditingController();
  final TextEditingController nepaliController = TextEditingController();
  Future<void> _selectEnglishDate(BuildContext context) async {
    final LoanStateProvider loanStateProvider = Provider.of<LoanStateProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedEnglishDate) {
      setState(() {
        _selectedEnglishDate = picked;
        _selectedNepaliDate = picked.toNepaliDateTime();
          String nepaliDateString = _selectedNepaliDate.toString();
        List<String> parts = nepaliDateString.split(' ');
        String nepaliDateWithoutTime = parts[0];
   

       
 
        String englishDateString = _selectedEnglishDate.toString();
        List<String> partss = englishDateString.split(' ');
        String englishDateWithoutTime = partss[0];
if(widget.isSaving == false){

   loanStateProvider.loantrandatebs.text = nepaliDateWithoutTime;
   loanStateProvider.loantrandatead.text = englishDateWithoutTime;
}else{
  loanStateProvider.trandatebs.text = nepaliDateWithoutTime;
   loanStateProvider.trandatead.text = englishDateWithoutTime;
}
        _dateController.text = '${picked.year}-${picked.month}-${picked.day}';
      });
    }
  }

  Future<void> _selectNepaliDate(BuildContext context) async {
    final LoanStateProvider loanStateProvider = Provider.of<LoanStateProvider>(context, listen: false);
    final picker.NepaliDateTime? picked = await picker.showAdaptiveDatePicker(
      context: context,
      initialDate: picker.NepaliDateTime.now(),
      firstDate: picker.NepaliDateTime(2000, 1, 1), // Nepali equivalent of 1900
      lastDate:
          picker.NepaliDateTime(2100, 12, 31), // Nepali equivalent of 2101
    );
    if (picked != null && picked != _selectedNepaliDate) {
      setState(() {
        _selectedNepaliDate = picked;
        _selectedEnglishDate = picked.toDateTime();

        String nepaliDateString = _selectedNepaliDate.toString();
        List<String> parts = nepaliDateString.split(' ');
        String nepaliDateWithoutTime = parts[0];
   

       
 
        String englishDateString = _selectedEnglishDate.toString();
        List<String> partss = englishDateString.split(' ');
        String englishDateWithoutTime = partss[0];
if(widget.isSaving == false){

   loanStateProvider.loantrandatebs.text = nepaliDateWithoutTime;
   loanStateProvider.loantrandatead.text = englishDateWithoutTime;
}else{
  loanStateProvider.trandatebs.text = nepaliDateWithoutTime;
   loanStateProvider.trandatead.text = englishDateWithoutTime;
}
        

        _dateController.text = '${picked.year}-${picked.month}-${picked.day}';
      });
    }
  }

  void _showDatePicker() {
    if (_selectedDateType == 'English') {
      _selectEnglishDate(context);
    } else {
      _selectNepaliDate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                                    child: Datename(
                                        selectedDateFormat: _selectedDateType),
                                  ),
              Expanded(
                child: CustomDropdownButton(
                                            items: ['English', 'Nepali']
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedDateType = newValue!;
                                                   _dateController.clear();
                                                   _selectedEnglishDate = null;
                      _selectedNepaliDate = null;
                                              });
                                            },
                                            value: _selectedDateType,
                                          ),
              ),
            ],
          ),
        
          const SizedBox(height: 20),

          Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10,),
          Container(
            height: 50.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            color: AppColors.greyColor,
            ),
            
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                 border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _showDatePicker,
                  ),
                ),
                readOnly: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
