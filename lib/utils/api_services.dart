class ApiService {
  final contentTypeJsonHeader = {'Content-Type': 'application/json'};
  // http://202.53.174.5:8000/ global
  // http://192.168.29.31:5500/ local
  final String baseUrlheroku = 'https://readyplates.herokuapp.com';
  final String baseUrlLive = "http://202.53.174.5:8000";
  final String baseUrlLocal = "http://192.168.0.194:5500";
  String get baseUriImage => baseUrlLocal;
  String get baseUri => baseUriImage + "/";

  Uri customers(String path) => Uri.parse(baseUri + "customers/" + path);

  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);
  Uri get loginUri => customers('login/');
  Uri get registerUri => customers('register/');
  Uri get image => customers('image/');
  Uri get location => customers('location/');
  Uri get changePass => customers("resetpass/");

  Uri menuList(String id) => customers('menulist/$id/');

  Uri get restaurantList => customers('get/');
  Uri get restList => customers('restlist/');

  Uri get addToCart => customers('cart/');
  Uri cartList(String id) => customers('cart/$id');

  Uri orderList(String id) => customers('order/$id');
  Uri get ordersapi => customers("order/");

  Uri get updateStatusUrl => customers('updatestatus/');

  Uri singleRestaurantUri(int id) => customers('getrestaurant/$id');

  Uri get feedbackApi => customers("feedback/");

  Uri get tableList => restaurants("availabletable/");
}
