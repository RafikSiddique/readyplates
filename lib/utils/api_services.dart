import 'package:connectivity_plus/connectivity_plus.dart';

class ApiService {
  final contentTypeJsonHeader = {'Content-Type': 'application/json'};

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    return connectivityResult != ConnectivityResult.none;
  }

  final String baseUrlheroku = 'https://readyplates.herokuapp.com';
  final String baseUrlLive = "http://202.53.174.5:8000";
  final String baseUrlCRM = "http://35.200.132.65:5500";
  final String baseUrlLocal = "http://192.168.29.89:8000";
  final String baseUrlFladdra = "http://192.168.29.31:5500";
  String get baseUriImage => baseUrlLive;
  String get baseUri => baseUrlLive + "/";

  Uri customers(String path) => Uri.parse(baseUri + "customers/" + path);

  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);

  Uri accounts(String url) => Uri.parse(baseUri + "accounts/" + url);

  Uri availableTable(String id) => restaurants('table/$id');

  Uri get loginUri => customers('login/');
  Uri get registerUri => customers('register/');
  Uri get image => customers('image/');
  Uri get location => customers('location/');
  Uri get changePass => customers("resetpass/");
  Uri get forgotUri => accounts('forgotpass/');

  Uri menuList(String id) => customers('menulist/$id/');

  Uri get restaurantList => customers('get/');
  Uri get restList => customers('restlist/');

  Uri get addToCart => customers('cart/');
  Uri cartList(String id) => customers('cart/$id');

  Uri orderList(String id) => customers('order/$id');
  Uri get ordersapi => customers("order/");

  Uri get updateStatusUrl => restaurants('updatestatus/');

  Uri singleRestaurantUri(int id) => customers('getrestaurant/$id');

  Uri get feedbackApi => customers("feedback/");

  Uri get tableList => restaurants("availabletable/");

  //Uri get orderCountApi => restaurants('ordercount/');
  Uri autoOrders(String resid) => restaurants('autoorders/$resid');
}
