import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:moneycollection/config/app_url.dart';
import 'package:moneycollection/provider/utils/api_helper/app_exception.dart';

class ApiBaseHelper {
  Future<dynamic> getData(String url) async {
    // try {
    final response = await http.get(Uri.parse(url));
    debugPrint("Response: ${response.body}");
    return json.decode(response.body);
    // } catch (e) {
    //   throw FetchDataException('Failed to fetch data. Error: $e');
    // }
  }

  // Future<dynamic> getDataWithToken(String url) async {
  //   debugPrint("this is url $url");
  //   // debugger();
  //   log(Constant.loginToken, name: "LoginToken");
  //   // try {
  //   var header = {
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${Constant.loginToken}"
  //   };
  //   final response = await http.get(Uri.parse(url), headers: header);
  //   debugPrint("Response: ${response.body}");
  //   debugPrint("Response: ${response.statusCode}");
  //   return json.decode(response.body);
  //   // } on SocketException {
  //   //   throw FetchDataException('No Internet connection');
  //   // }
  // }

  Future<dynamic> postMethod(String url, dynamic body, String token) async {
    // try {
    debugPrint("this is body server $body");
    var header = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    final response =
        await http.post(Uri.parse(url), body: body, headers: header);
    debugPrint("this is errror $response");
    debugPrint("this is response code ${response.statusCode}");
    return json.decode(response.body);
    // } catch (e) {
    //   throw FetchDataException('Failed to perform POST request. Error: $e');
    // }
  }

  Future getdepositeaccount(String token) async {
    print("kxxxxa");
    try {
      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Add token to Authorization header
      };
      print("printing $header");

      var response = await http.get(
        Uri.parse(ApiUrl.depositAccount),
        headers: header,
      );
      print("prnting respose${response}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  ///getprofiledetails
  Future getprofiledetails(String token) async {
    print("kxa");
    try {
      var header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Add token to Authorization header
      };
      print("printing $header");

      var response = await http.get(
        Uri.parse(ApiUrl.user),
        headers: header,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }
}

Future<dynamic> postMethodWithOutContainType(String url, dynamic body) async {
  // try {
  debugPrint("this is body serve r$body");
  var header = {
    "Accept": "application/json",
    // "Content-Type": "application/json",
  };
  final response = await http.post(Uri.parse(url), body: body, headers: header);
  debugPrint("this is errror ${response.body}");
  debugPrint("this is response code ${response.statusCode}");
  return json.decode(response.body);
  // } catch (e) {
  //   throw FetchDataException('Failed to perform POST request. Error: $e');
  // }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body);
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while communicating with the server. StatusCode: ${response.statusCode}');
  }
}
