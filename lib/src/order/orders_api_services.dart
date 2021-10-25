import 'dart:convert';

import 'package:http/http.dart';
import 'package:readyplates/models/cart_model.dart';
import 'package:readyplates/models/order_model.dart';
import 'package:readyplates/utils/api_services.dart';
import 'package:readyplates/utils/exception.dart';
import 'package:readyplates/utils/shared_preference_helper.dart';

class Orderservices extends ApiService {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  Future<void> addToCartApi(
    String user,
    String food_item,
    String count,
  ) async {
    try {
      Response response = await post(addToCart,
          body: jsonEncode(
            {
              'user': "8",
              'food_item': food_item,
              'count': count,
            },
          ),
          headers: contentTypeJsonHeader);
      if (response.statusCode != 201) {
        throw AppException(code: response.statusCode, message: response.body);
      }
    } catch (a) {
      rethrow;
    }
  }

  Future<List<CartModel>> getCart(String id) async {
    try {
      Response response =
          await get(cartList(id), headers: contentTypeJsonHeader);
      print(response.body);
      if (response.statusCode == 201) {
        List<dynamic> data = jsonDecode(response.body);
        List<CartModel> cartItems =
            data.map((e) => CartModel.fromMap(e)).toList();
        return cartItems;
      } else if (response.statusCode != 404) {
        return <CartModel>[];
      } else {
        throw AppException(
            code: response.statusCode, message: response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> orderapi(OrderModel ordermodel
      // String user,
      // String restaurant,
      // String menu,
      // String name,
      // double price,
      // int quantity,
      // int no_of_table,
      // int no_of_people,
      // double time,
      // double tax,
      ) async {
    try {
      Response response = await post(ordersapi,
          body: ordermodel.toJson(),

          // body: jsonEncode(
          //   {
          //     // 'user': user,
          //     // 'restaurant': restaurant,
          //     // 'menu': menu,
          //     // 'name': name,
          //     // 'price': price,
          //     // 'quantity': quantity,
          //     // 'no_of_table': no_of_table,
          //     // 'no_of_people': no_of_people,
          //     // 'time': time,
          //     // 'tax': tax,
          //   },
          // ),
          headers: contentTypeJsonHeader);
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
            data.map((e) => OrderModel.fromMap(e)).toList(); //TODO :
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


//  Future<List<FoodItemModel>> getMenu(String id) async {
//     try {
//       Response response = await get(
//         menuList(id),
//       );

//       print(response.body);
//       if (response.statusCode == 200) {
//         List<dynamic> list = jsonDecode(response.body);

//         List<FoodItemModel> foodItems =
//             list.map((e) => FoodItemModel.fromMap(e)).toList();
//         print(foodItems);
//         return foodItems;
//       } else {
//         throw AppException(
//             code: response.statusCode, message: response.reasonPhrase);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }


// Method:GET
// Endpoint:BASE_URL/restaurants/orders/user_id

// Here user_id is the id of user for whim u want to get the orders


// Method:POST
// Endpoint:BASE_URL/restaurants/orders/
// Fields :user,(User ID)
// restaurant,	(Restaurant ID)
// menu,(Menu ID)
// name,(Food Item name)
// price,(Food Item Price)
// quantity,(Count of Food Item ordered)
// no_of_table,(no of tables required)
// no_of_people,(No of peoples)
// time,(Expected time)
// tax(Taxex)
