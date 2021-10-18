import 'dart:convert';
import 'dart:io';

import 'package:readyplates/utils/api_services.dart';
import 'package:http/http.dart' as http;
import 'package:readyplates/utils/exception.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class AuthenticationServices extends ApiService {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  Future<String> login(
    String username,
    String password,
  ) async {
    try {
      http.Response response = await http.post(
        loginUri,
        body: jsonEncode(
          {
            'username': username,
            'password': password,
          },
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        Map resp = json.decode(response.body);
        print(resp["ID"]);
        String id = resp["ID"].toString();
        print('User Id is ---->' + id);
        print(response.body);
        return id;
      } else {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> uploadImage(File file) async {
    try {
      String id = await sharedPreferenceHelper.getUserId();
      http.MultipartRequest request = http.MultipartRequest('POST', image);
      request.fields.addAll({"id": id});
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('image', file.path);
      request.files.add(multipartFile);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("success");
        String body = await response.stream.bytesToString();
        print(body);
        return true;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> register({
    required String email,
    required String password,
    required String password2,
    required String fName,
    required String lName,
    required String gender,
    required String dob,
    required String mobNum,
  }) async {
    try {
      http.Response res = await http.post(
        registerUri,
        headers: contentTypeJsonHeader,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'password2': password2,
            'first_name': fName,
            'last_name': lName,
            'gender': gender,
            'dob': dob,
            'mob_num': mobNum,
          },
        ),
      );
      if (res.statusCode != 201) {
        throw AppException(code: res.statusCode, message: res.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
