import 'dart:convert';
import 'package:http/http.dart';
import 'package:readyplates/models/restaurant_list.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';

class HomeServices extends ApiService {
  Future<List<RestaurantModel>> getResDetail() async {
    try {
      Response response = await get(restaurantList());

      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> getList = jsonDecode(response.body);
        List<RestaurantModel> resDetail =
            getList.map((value) => RestaurantModel.fromMap(value)).toList();
        print(resDetail);
        return resDetail;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
