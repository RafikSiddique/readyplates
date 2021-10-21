import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:readyplates/models/restaurant_list.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';

class HomeServices extends ApiService {
  Future<List<Restaurant>> getResDetail(String id) async {
    http.Response response = await get(restaurantList(id));

    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> getList = jsonDecode(response.body);
      List<Restaurant> resDetail =
          getList.map((value) => Restaurant.fromMap(value)).toList();
      print(resDetail);
      return resDetail;
    } else {
      throw AppException(
          code: response.statusCode, message: response.reasonPhrase);
    }
  }
}
