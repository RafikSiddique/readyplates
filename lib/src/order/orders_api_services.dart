import 'dart:convert';

import 'package:http/http.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class Orderservices extends ApiService {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  Future<void> addToCartApi(CartModel cartModel) async {
    try {
      Response response = await post(addToCart,
          body: cartModel.toJson(), headers: contentTypeJsonHeader);
      print(response.body);
      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (a) {
      rethrow;
    }
  }

  Future<List<CartApiModel>> getCart(String id) async {
    try {
      print('object');
      Response response =
          await get(cartList(id), headers: contentTypeJsonHeader);
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          List<CartApiModel> cartItems =
              data.map((e) => CartApiModel.fromMap(e)).toList();
          return cartItems;
        } else {
          return <CartApiModel>[];
        }
      } else if (response.statusCode != 404) {
        return <CartApiModel>[];
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> orderapi(OrderModel ordermodel) async {
    try {
      Response response = await post(ordersapi,
          body: ordermodel.toJson(), headers: contentTypeJsonHeader);
      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (a) {
      rethrow;
    }
  }

  Future<List<OrderModel>> getorder(String id) async {
    try {
      Response response =
          await get(orderList(id), headers: contentTypeJsonHeader);
      print(response.body);
      if (response.statusCode == 201) {
        List<dynamic> data = jsonDecode(response.body);
        List<OrderModel> orderItems =
            data.map((e) => OrderModel.fromMap(e)).toList();
        return orderItems;
      } else if (response.statusCode != 404) {
        return <OrderModel>[];
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
}
