import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:intl/intl.dart';
import 'package:moneycollection/config/app_url.dart';



class Utilities {
  static decodeHtmlData(String? encodedData) {
    if (encodedData != null) {
      var dom = htmlParser.parse(encodedData);
      return dom.body!.text;
    }
    return '';
  }

  String formatDateFromUTC(String timestamp) {
    try {
      // Parse the timestamp
      DateTime dateTime = DateTime.parse(timestamp);

      // Format the date and time
      String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);

      return formattedDateTime;
    } catch (e) {
      // Handle parsing errors
      debugPrint('Error parsing timestamp: $e');
      return 'Invalid timestamp';
    }
  }

  String formatAgoFromTimeUTC(String timestamp) {
    try {
      // Parse the timestamp
      DateTime dateTime = DateTime.parse(timestamp);

      // Calculate the time difference
      Duration difference = DateTime.now().toUtc().difference(dateTime);

      if (difference.inSeconds < 60) {
        return '${difference.inSeconds} sec ago';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} min ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hr ago';
      } else {
        // Format the date and time
        String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);
        return formattedDateTime;
      }
    } catch (e) {
      // Handle parsing errors
      debugPrint('Error parsing timestamp: $e');
      return 'Invalid timestamp';
    }
  }

  String formatDate( dateTime) {
    if (dateTime != null) {
      return DateFormat('E, d MMM').format(DateTime.parse(dateTime));
    } else {
      return ''; // or any default value you prefer
    }
  }

  static void showCustomSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  String  replaceAll(String value){
    var data = value.replaceAll(ApiUrl.server, ApiUrl.imageUrl);
    return data ;
  }
}
