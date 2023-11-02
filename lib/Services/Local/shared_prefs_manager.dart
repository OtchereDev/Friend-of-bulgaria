import 'dart:convert';
// import 'package:collector_app/Model/user_model.dart';
// import 'package:hackaton/Model/user_model.dart';
import 'package:hackaton/Model/Response/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  final String authToken = "auth_token";
  final String paymentToken = "payment_token";
  final String baseCurrency = "base_currency";
  final String getStarted = "getStarted";

//set data into shared preferences like this
  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(authToken, token);
  }

   Future<void> setPaymentAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(paymentToken, token);
  }

  Future<User?> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var user = preferences.getString('user');
    if (user == null) {
      return null;
    }
    return User.fromJson(jsonDecode(user));
  }

  Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? newToken;
    newToken = pref.getString(authToken) ?? "";
    return newToken;
  }
    Future<String> getPaymentToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? newToken;
    newToken = pref.getString(paymentToken) ?? "";
    return newToken;
  }

  getPushNotificationToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('pushNotificationToken');
    return token;
  }

  setPushNotificationToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pushNotificationToken', token);
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? phone = prefs.getString(authToken);
    print(phone);
    if (phone != null) {
      return true;
    }
    return false;
  }

 Future<bool> getGetstarted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? phone = prefs.getBool(getStarted);
    return phone ?? false;
  }

  setGetStarted(bool token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(getStarted, token);
  }
  // setBranch(Branch.Item item) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('branch', jsonEncode(item.toJson()));
  // }
  // Future<Branch.Item?> getBranch() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var branch = preferences.getString('branch');
  //   if (branch == null) {
  //     return null;
  //   }
  //   return Branch.Item.fromJson(jsonDecode(branch));
  // }

  setUser(User user) async {
    // print(
    //     "------------------------------------------------------------------------------");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('user', jsonEncode(user.toJson()));
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
