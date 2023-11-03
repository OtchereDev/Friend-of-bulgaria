import 'dart:convert';

import 'package:hackaton/Core/Mixins/auth_base_repository.dart';
import 'package:hackaton/Core/Repositories/Event/event_repo.dart';
import 'package:hackaton/Core/app_constants.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';

class EventRemoteService with AuthBaseRepository implements EventRepository {
  @override
  String token = "N/A";
  // SharedPrefsManager _manager = new SharedPrefsManager();

  @override
  Future<Map<String, String>> setHeaders() async {
    token = await SharedPrefsManager().getAuthToken();
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      "x-email": "oliverotchere4@gmail.com"
    };
  }

  @override
  Future<dynamic> getAllEvent(context, {int? offset, int? limit}) async {
    dynamic responseMap = {"status": false, "message": "", "data": null};
    // print(jsonEncode(data));
    await get(
      context,
      url: "$baseUrl/?rest_route=/wp/v2/fundraising-event",
    ).then((response) {
      if (response != null) {
        var dataResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          responseMap['status'] = true;
          // responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        } else {
          responseMap['message'] = dataResponse['message'];
          responseMap['data'] = dataResponse;
        }
      }
    });
    return responseMap;
  }

  @override
  Future<dynamic> getMyEvent(context, {int? offset, int? limit}) async {
    dynamic responseMap = {"status": false, "message": "", "data": null};
    await get(
      context,
      url: "$baseUrl/ticket/own?page=$offset&limit=$limit",
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
    });
    return responseMap;
  }
}
