
import 'package:flutter/material.dart';
import 'package:hackaton/Model/Response/user_model.dart';
import 'package:hackaton/Services/Local/shared_prefs_manager.dart';

class ProfileProvider extends ChangeNotifier {
  final SharedPrefsManager _sharedPrefsManager = SharedPrefsManager();
  // final ProfileService _profileFactory = ProfileService();
  User? _currentUserProfile;
  User? get currentUserProfile => _currentUserProfile;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _selectedCountry;
  String? get selectedCountry => _selectedCountry;



  void setCurrentUserProfile(User user) {
    _currentUserProfile = user;
    // print("setting current user to shared Prefs ${user.toJson()}");
    _sharedPrefsManager.setUser(user);
    notifyListeners();
  }

  resetUser(context) async {
    await getUser(context);
  }



  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  getUser(context, {bool fromRemote = false}) async {
    User? user = await _sharedPrefsManager.getUser();

    if (user != null) {
      setCurrentUserProfile(user);
    }
    return user;
  }

  ProfileProvider(context) {
    loadCurrentProfile(context);
  }

  Future<User?> loadCurrentProfile(context) async {
    getUser(context);
    return null;
  }

  Future logout(context) async {
    await _sharedPrefsManager.logout();
    _currentUserProfile = null;
    notifyListeners();
  }



}
