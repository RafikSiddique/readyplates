import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/models/restaurant_model.dart';
import 'package:readyplates/models/table_model.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class Orderservices extends ApiService {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  Future<RestaurantModel> getRes(int id) async {
    try {
      Response response =
          await get(singleRestaurantUri(id), headers: contentTypeJsonHeader);
      print(response.request);
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

  Future<List<TableModel>> getAvailableTable(String id) async {
    try {
      Response response = await get(
        availableTable(id),
      );

      if (response.statusCode == 200) {
        List<dynamic> list = (jsonDecode(response.body) as Map)['data'];

        List<TableModel> tables =
            list.map((e) => TableModel.fromMap(e)).toList();
        print(tables);
        return tables;
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

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

  Future<bool> getAutoOrder(String resid) async {
    try {
      Response res = await get(autoOrders(resid));
      if (res.statusCode == 200) {
        Map data = jsonDecode(res.body);
        return data['Auto-Order-On'];
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

/*   Future<int> orderCount(int resId, String date) async {
    try {
      Response response = await post(orderCountApi,
          body: {'restaurant': resId.toString(), 'date': date});
      if (response.statusCode == 200 || response.statusCode == 400) {
        var data = jsonDecode(response.body);
        if (data is Map) {
          int? count = int.tryParse(data['Order Count'].toString());
          return count ?? 0;
        } else {
          return 0;
        }
      } else {
        throw AppException(message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  } */

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

  Future<OrderModelApi> orderapi(OrderModel ordermodel) async {
    try {
      Request request = Request(
        'POST',
        ordersapi,
      );
      String body = ordermodel.toJson();
      request.headers.addAll({'Content-Type': 'application/json'});
      request.body = body;
      StreamedResponse response = await request.send();
      String b = await response.stream.bytesToString();
      print(b);
      print(response.statusCode);
      if (response.statusCode != 201) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      } else {
        String data = b;
        print(data);
        return OrderModelApi.fromMap(jsonDecode(data)['data']);
      }
    } catch (a) {
      rethrow;
    }
  }

  //
  Future<void> patchOrder(OrderEditModel orderItems) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      Request request = Request('PATCH', ordersapi);
      request.body = json.encode({
        "id": orderItems.orderId,
        "orderitems": [orderItems.toMap()],
      });
      request.headers.addAll(headers);

      StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());
      if (response.statusCode == 200) {
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> putOrder(OrderEditModel orderItems) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      Request request = Request('PUT', ordersapi);
      request.body = json.encode({
        "id": orderItems.orderId,
        "orderitems": [orderItems.toPut()],
      });
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());
      if (response.statusCode == 200) {
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }
  //

  Future<void> updateStatus(int id, int status) async {
    try {
      var request = MultipartRequest('PUT', updateStatusUrl);
      request.fields.addAll({
        'id': id.toString(),
        'status': status.toString(),
      });
      var response = await request.send();
      if (response.statusCode != 202) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatetip(int id, String tip) async {
    try {
      var request = MultipartRequest('PUT', updateStatusUrl);
      request.fields.addAll({
        'id': id.toString(),
        'tip': tip,
      });
      var response = await request.send();
      if (response.statusCode != 202) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFeedback(String id, int status) async {
    try {
      var request = MultipartRequest('PUT', updateStatusUrl);
      request.fields.addAll({
        'id': id.toString(),
        'feedbackstat': status.toString(),
      });
      var response = await request.send();
      if (response.statusCode != 202) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePayment(int id, int status) async {
    try {
      var request = MultipartRequest('PUT', updateStatusUrl);
      request.fields.addAll(
          {'id': id.toString(), 'payment': status.toString(), 'table': ''});
      var response = await request.send();
      if (response.statusCode != 202) {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrderModelApi>> getorder(String id) async {
    try {
      Response response =
          await get(orderList(id), headers: contentTypeJsonHeader);

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200 && jsonDecode(response.body) is List) {
        List<dynamic> data = jsonDecode(response.body);
        List<OrderModelApi> orderItems =
            data.map((e) => OrderModelApi.fromMap(e)).toList();
        return orderItems;
      } else if (response.statusCode != 404) {
        return <OrderModelApi>[];
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> feedbackapi(
    String restaurant,
    String user,
    String order,
    String overall_experience,
    String taste,
    String ambience,
    String serving_time,
    String feedback,
    File? image,
  ) async {
    try {
      MultipartRequest request = MultipartRequest('POST', feedbackApi);
      if (image != null) {
        MultipartFile img = await MultipartFile.fromPath('image', image.path);
        request.files.addAll([img]);
      }
      request.fields.addAll({
        'restaurant': restaurant,
        'user': user,
        'order': order,
        'overall_experience': overall_experience,
        'taste': taste,
        'ambience': ambience,
        'serving_time': serving_time,
        'feedback': feedback,
      });
      print('body3');
      StreamedResponse response = await request.send();
      print('body4');
      print(response.statusCode);
      if (response.statusCode == 201) {
        String fbid = ["id"].toString();
        print(fbid);
        print('body5');
        String body = await response.stream.bytesToString();
        print(body);
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

//   Future<List<dynamic>> tableconfig(String id, TableModel tableModel) async {
//     try {
//       Response response = await post(tableList,
//           headers: contentTypeJsonHeader, body: tableModel.toJson());
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//         print(data);
// /*         List<TableModelapi> listOfTables =
//             data.map((e) => TableModelapi.fromMap(e)).toList(); */
//         return data;
//       } else {
//         throw AppException(
//             code: response.statusCode, message: response.reasonPhrase);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
}
