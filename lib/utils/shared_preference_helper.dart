import 'package:readyplates/utils/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  final String _token = "token";
  final String _isLoggedIn = "loggedin";
  final String _userId = "userId";
  final String _address = "address";
  final String _latitude = "lat";
  final String _longitude = "lon";
  final String _miles = "miles";

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

  Future<String?> getUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_userId);
    if (token == null) {
      return null;
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

  Future<bool> setAddress(String address) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool success = await sharedPreferences.setString(_address, address);
    return success;
  }

  Future<String> getAddress() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? add = sharedPreferences.getString(_address);
    if (add != null) {
      return add;
    } else {
      return "";
    }
  }

  Future<bool> setMiles(double miles) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool success = await preferences.setDouble(_miles, miles);
    return success;
  }

  Future<double> getMiles() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double? data = preferences.getDouble(_miles);

    if (data != null)
      return data;
    else {
      return 15;
    }
  }

  Future<bool> setLat(double lat) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool success = await preferences.setDouble(_latitude, lat);
    return success;
  }

  Future<double> getLat() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double? data = preferences.getDouble(_latitude);
    if (data != null)
      return data;
    else {
      throw AppException(code: 0, message: "Unknown Coords");
    }
  }

  Future<bool> setLon(double lon) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool success = await preferences.setDouble(_longitude, lon);
    return success;
  }

  Future<double> getLon() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double? data = preferences.getDouble(_longitude);
    if (data != null)
      return data;
    else {
      throw AppException(code: 0, message: "Unknown Coords");
    }
  }
}
