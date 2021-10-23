import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class Orderservices extends ApiService {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  Future<dynamic> cart(
    String user,
    String food_item,
    String count,
  ) async {
    try {
      http.Response response = await http.post(loginUri,
          body: jsonEncode(
            {
              'user': user,
              'food_item': food_item,
              'count': count,
            },
          ),
          headers: contentTypeJsonHeader);
      if (response.statusCode == 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (a) {
      rethrow;
    }
  }
}
