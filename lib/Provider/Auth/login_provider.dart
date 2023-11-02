import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart'
import 'package:hackaton/Model/Request/user_request.dart';
import 'package:hackaton/Model/Response/user_model.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';
import 'package:hackaton/Services/Remote/Authentication/auth_remote_service.dart';
import 'package:hackaton/Utils/Dialogs/notifications.dart';

class AuthProvider extends ChangeNotifier {
  AuthRemoteService authService = AuthRemoteService();
  // final ProfileFactory _profileFactory = ProfileFactory();
  // LoadingState _loadingState = LoadingState.idle;
  final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();
  bool _loadPage = false;
  bool get loadPage => _loadPage;

  setLoadingPage(bool value) {
    _loadPage = value;
    notifyListeners();
  }


  Future<bool?> performLogin(context,
      {required String email, required String password}) async {
    setLoadingPage(true);
    bool? actionSuccessful = false;
    Map<String, dynamic> data = {"email": email, "password": password};
    await authService.signin(context, data).then((response) async {
      print(response['data']['access_token']);
      if (response['error'] != null) {
        setLoadingPage(false);
        NotificationUtils.showToast(context, message:  response['error']);
        // Get.dialog(Dialog(
        //     child: DailogWidget(
        //   message: response['error'],
        //   title: 'Login failed',
        //   hasError: true,
        // )));
      }
      if (response['data'] != null) {
        setLoadingPage(false);
        actionSuccessful = true;
        await _sharedPrefsManager.setAuthToken(response['data']['access_token']);
        await _sharedPrefsManager.setUser(User.fromJson(response));
      }
    });
    return actionSuccessful;
  }

  Future<bool?> signUp(context, UserRequest userRquest) async {
    bool actionSuccessful = false;
    setLoadingPage(true);
    await authService
        .signup(context, userRquest.toJson())
        .then((response) async {
      debugPrint(response.toString());
      if (response != null) {
        if (response['status'] == true) {
          setLoadingPage(false);
          NotificationUtils.showToast(context,
              message: "Account created successfully");
          actionSuccessful = true;
          await _sharedPrefsManager.setAuthToken(response['data']['data']['token']);
          await _sharedPrefsManager.setUser(User.fromJson(response['data']));
        } else {
          setLoadingPage(false);
          // var msg = response['data']['error']['detail'][0];
          // print("------------------${msg.toString()}-----------------");
          // Get.dialog(Dialog(
          //     child: DailogWidget(
          //   message:msg['message'],
          //   title: 'Registration failed',
          //   hasError: true,
          // )));
        }
      }
    });
    return actionSuccessful;
  }
  }
