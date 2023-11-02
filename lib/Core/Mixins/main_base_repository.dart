import 'dart:convert';

import 'package:hackaton/Services/Remote/Authentication/auth_remote_service.dart';
import 'package:http/http.dart' as http;
// import 'package:oya_fuel/Services/Local/shared_prefs_manager.dart';
import '../../main.dart';

mixin BaseRepository {
  AuthRemoteService auth = AuthRemoteService();
  // final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();

  Future<http.Response> post({required String url, dynamic data}) async {
    Map<String, String> headers = await auth.setHeaders();
    String encodedData = data == null ? "{}" : jsonEncode(data);

    http.Response response =
        await http.post(Uri.parse(url), body: encodedData, headers: headers);
    if (response.statusCode == 401) {
      main();
    }

    return response;
  }

 
}
