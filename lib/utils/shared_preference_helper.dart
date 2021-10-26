import 'package:readyplates/utils/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final String _token = "token";
  final String _isLoggedIn = "loggedin";
  final String _userId = "userId";

  Future<bool> setUserToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_token, token);
    return success;
  }

  Future<String> getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_token);
    if (token == null) {
      throw AppException(message: "No token found");
    } else
      return token;
  }

  Future<bool> setUserId(String id) async {
    print("Setting user Id.....");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_userId, id);
    print("User id succesfully set");
    return success;
  }

  Future<String> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_userId);
    if (token == null) {
      throw AppException(message: "No such user found");
    } else
      return token;
  }

  Future<bool> setLoggedIn(bool loggedIn) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setBool(_isLoggedIn, loggedIn);
    return success;
  }

  Future<bool> getLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? success = sharedPreferences.getBool(_isLoggedIn);
    if (success == null) {
      return false;
    } else {
      return success;
    }
  }
}
