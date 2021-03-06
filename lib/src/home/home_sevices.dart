import 'dart:convert';
import 'package:http/http.dart';
import 'package:readyplates/models/food_item_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';

class HomeServices extends ApiService {
  Future<List<RestaurantModel>> getResDetail() async {
    try {
      Response response = await get(restaurantList);

      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> getList = jsonDecode(response.body);
        List<RestaurantModel> resDetail = getList
            .map((value) => RestaurantModel.fromMap(value))
            .where((e) => e.bio.isNotEmpty)
            .toList();
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

    Future<RestaurantModel> getRes(int id) async {
    try {
      Response response =
          await get(singleRestaurantUri(id), headers: contentTypeJsonHeader);
      if (response.statusCode == 200) {
        print(response.request);
        Map<String, dynamic> data = jsonDecode(response.body).first;
        return RestaurantModel.fromMap(data);
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RestaurantModel>> getRestaurantWithSort(
      double lat, double lon, double miles) async {
    try {
      print(lat);
      print(lon);
      MultipartRequest request = MultipartRequest('POST', restList);
      request.fields.addAll({'latitude': "$lat", 'longitude': "$lon"});
      /* Response response = await post(restList,
          headers: contentTypeJsonHeader,
          body: jsonEncode({'latitude': lat, 'longitude': lon})); */
      StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String body = await response.stream.bytesToString();
        List<dynamic> getList = jsonDecode(body);
        List<RestaurantModel> resDetail = getList
            .where((element) => (element['bio'] as List).isNotEmpty && !((element['bio'] as List).first as Map)
                .values
                .any((element) => element == null))
            .map((value) => RestaurantModel.fromMap(value))
            .where((e) => e.bio.isNotEmpty && double.parse(e.address2) <=miles)
            .toList();
        print(getList);
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

  Future<List<FoodItemModel>> getMenu(String id) async {
    try {
      Response response = await get(
        menuList(id),
      );

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        List<FoodItemModel> foodItems =
            list.map((e) => FoodItemModel.fromMap(e)).toList();
        print(foodItems);
        return foodItems;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
