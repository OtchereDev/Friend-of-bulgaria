import 'dart:convert';

import 'package:hackaton/Core/Mixins/auth_base_repository.dart';
import 'package:hackaton/Core/Repositories/Auth/auth_repository.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:http/http.dart' as http;

class AuthRemoteService with AuthBaseRepository implements AuthRepository {
  @override
  String token = "N/A";
  // SharedPrefsManager _manager = new SharedPrefsManager();

  @override
  Future<Map<String, String>> setHeaders() async {
    token = await SharedPrefsManager().getAuthToken();
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  // registers device for firebase notifications
  @override
  Future<bool> registerDevice(String token) async {
    try {
      Map<String, String> headers = await setHeaders();
      var data = {'device_token': token};

      var response = await http.post(Uri.parse(baseUrl),
          body: jsonEncode(data), headers: headers);
      return response.statusCode == 200;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> signin(context, data) async {
    dynamic responseMap;
    await post(
      context,
      url: "$baseUrl/auth/login",
      data: jsonEncode(data),
    ).then((response) {
      if (response?.body != null) responseMap = json.decode(response!.body);
    });
    
    return responseMap;
  }

  @override
  Future<dynamic> signup(context, data) async {
    dynamic responseMap = {"status": false, "message": "", "data": null};
    // print(jsonEncode(data));
    await post(
      context,
      url: "$baseUrl/register",
      data: jsonEncode(data),
    ).then((response) {
      if (response != null) {

        var dataResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          responseMap['status'] = true;
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        } else {
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        }
      }
      // print(responseMap);
    });
    return responseMap;
  }


}
