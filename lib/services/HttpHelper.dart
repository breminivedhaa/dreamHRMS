import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../exception.dart';

class HttpHelper {
  Future<dynamic> get(
    String url, {
    bool auth = false,
  }) async {
    Map<String, String> hd = await getHeaders(
      auth,
    );

    print("Api URL:$url header:$hd");
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url), headers: hd);
      print("test response : $response code :${response.statusCode}");
      responseJson = _returnResponse(response);
    } catch (e) {
      print("web server error $e");
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body,
      {bool auth = false, bool contentHeader = false}) async {
    Map<String, String> hd =
        await getHeaders(auth, contentHeader: contentHeader);
    print("Api URL:$url header $hd body : $body");
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body, headers: hd);
      print(response.body);
      print(" Response : ${json.decode(response.body)}");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection', 500);
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) async {
    if (response.statusCode == 500 || response.statusCode == 502) {
      throw FetchDataException('${jsonDecode(response.body)['message']}', 500);
    }
    // var responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = response.body;
        return responseJson;
      case 400:
        var responseJson = response.body;
        return responseJson;
      case 404:
        var message = "";
        throw BadRequestException(message.toString(), response.statusCode);
      //var responseJson = response.body;
      //return responseJson;
      case 401:
      case 403:
        //Utility.log('object');
        var message = "";

        throw UnauthorisedException("", message, response.statusCode);

        break;
      case 422:
        var responseJson = response.body.toString();
        return responseJson;
      case 502:
        throw FetchDataException('', 500);
      case 500:
        throw FetchDataException(
            '${json.decode(response.body)['message']}', 500);
      default:
        throw FetchDataException(
            '${json.decode(response.body)['message']}', 500);
    }
  }

  getHeaders(auth, {bool contentHeader = false}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.accessControlAllowOriginHeader: "*"
    };
    if (contentHeader == true) {
      headers.addAll({
        HttpHeaders.contentTypeHeader: "application/json",
        // HttpHeaders.contentTypeHeader: "Multipart/form-data",
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    debugPrint("TOKEN FROM THE SHARED PREF $token");
    if (token != null && token.isNotEmpty) {
      headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $token",
      });
    }
    return headers;
  }

  multipartPostData(
      {String method = "POST",
      required String url,
      // required Map<String, dynamic> body,
      bool auth = false,
      required String encrypt}) async {
    Map<String, String> hd = await getHeaders(auth, contentHeader: false);
    var responseJson;
    try {
      print("encrypt data $encrypt");
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll({"Content-Type":"multipart/form-data"});
      request.fields["request_data"] = encrypt;

      // var request = http.MultipartRequest('POST', Uri.parse("https://velankanni.dreamguystech.com/api/appuser/login"));
      // request.headers.addAll({"token":"DQCTPQMKK9R6SXN4"});
      // request.fields["username"] = "admin";
      // request.fields["password"] = "Velankanni@246";
      // request.fields["device_id"] = "fdfdfdfd";

      var res = await request.send();
      print("res${res.statusCode}");
      String result = await res.stream.bytesToString();
      print(result);
      print(res);
    } on SocketException {
      // throw FetchDataException(
      //     '', 500);    }
      debugPrint("onSocket Exception ${responseJson.toString()}");
      return responseJson;
    }

    jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
      for (var key in data.keys) {
        request.fields[key] = data[key].toString();
      }
      return request;
    }
  }
}
