// The best way to handle network requests in Flutter
// Applications frequently need to perform POST and GET and other HTTP requests.
// Flutter provides an http package that supports making HTTP requests.

// HTTP methods: GET, POST, PATCH, PUT, DELETE

import 'dart:convert';
import 'dart:developer';
import 'package:boiler_plate/global/config/api_string.dart';
import 'package:boiler_plate/global/config/local_storage.dart';
import 'package:boiler_plate/global/utils/services/end_point.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpHandler {
  static String baseURL = APIString.baseURL;

  static Future<Map<String, String>> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     final String? token = prefs.getString(LocalStorage.token,);


    devLog("Token -- '$token'");

    return {
      'Cookie': 'sp_session=t0t5gathfqjs8gk0m7elhj9p5o5vsqgi',
      'Content-type': 'application/json',
      if (token != null) 'Authorization': token,

    };
  }

  static Future<Map<String, dynamic>> formDataMethod(
      {required String url,
      Map<String, String>? body,
      String? imagePath,
      String? apiMethod,
      List<String>? imageList,
      dynamic webImage,
      String? imageKey}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(LocalStorage.token,);
    devLog("token ----  $token");

    var request = http.MultipartRequest(
      (apiMethod ?? "POST").toUpperCase(),
      Uri.parse(
        "$baseURL$url",
      ),
    );
    devLog("POST FORM DATA URL ----  $request");
    devLog("body ----  $body");

    // '$2y$10$eZ1Zdzvnkm3N9gVgXHAa0ecr6CcQ.h.wMhKoqgCZiE.wlU2qn/NfO'


    request.headers.addAll(
      {
        // if (token != null) 'Authorization': 'Bearer $token',
        if (token != null) 'Authorization': token,
        'Content-Type':
            'multipart/form-data; boundary=<calculated when request is sent>',

      },
    );

    devLog("FORM DATA BODY :-  $body");

    if (imagePath != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'image', // Form field name for the file
          webImage['path'],
          filename: webImage['name'], // Example content type for JPEG images
        ),
        // await http.MultipartFile.fromPath('$imageKey', imagePath),
      );
    }
    if (imageList != null) {
      for (var element in imageList) {
        request.files.add(
          await http.MultipartFile.fromPath('$imageKey', element),
        );
      }
    }
    if (body != null) {
      request.fields.addAll(body);
    }
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    String responseString = String.fromCharCodes(responseData);
    devLog("RESPONSE = $responseString");

    if (response.statusCode == 200) {
      var data = json.decode(
        responseString,
      );
      Map<String, dynamic> returnRes = {
        'body': data,
        'error': null,
      };
      return returnRes;
    } else {
      Map<String, dynamic> returnRes = {
        'body': null,
        'error': responseString,
      };
      log('Something went wrong');
      return returnRes;
    }
  }

  static Future<Map<String, dynamic>> getHttpMethod({
    @required String? url,
    bool isMockUrl = false,
  }) async {
    var header = await _getHeaders();

    http.Response response = await http.get(
      Uri.parse(isMockUrl ? "$url" : "$baseURL$url"),
      headers: header,
    );
    devLog("Get URL -- '$baseURL$url'");
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> postHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();

    devLog("Post URL -- '$baseURL$url'");
    devLog("Post Data -- '$data'");
    http.Response response = await http.post(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    devLog("-==-==-=-=-==statusCode-===-- ${response.statusCode}");
    devLog("-==-==-=-=-==statusBody-===-- $response");
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> patchHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    http.Response response = await http.patch(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> putHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await _getHeaders();
    devLog("Put URL -- '$baseURL$url'");
    devLog("Put Data -- '$data'");
    http.Response response = await http.put(
      Uri.parse("$baseURL$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    var res = handler(response);
    return res;
  }

  static Future<Map<String, dynamic>> deleteHttpMethod({
    @required String? url,
  }) async {
    var header = await _getHeaders();
    http.Response response =
        await http.delete(Uri.parse("$baseURL$url"), headers: header);
    var res = handler(response);
    return res;
  }

  static Map<String, dynamic> handler(http.Response response) {
    devLog("Response -- ' ${response.body}'");
    if (response.statusCode == 200) {
      return {
        'body': jsonDecode(response.body),
        'headers': response.headers,
        'error': null,
      };
    } else if (response.statusCode == 403) {
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    } else {
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }
}
