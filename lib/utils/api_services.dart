class ApiService {
  final contentTypeJsonHeader = {'Content-Type': 'application/json'};
  // http://202.53.174.5:8000/ global
  // http://192.168.29.31:5500/ local
  // https://readyplates.herokuapp.com/ Heroku
  final String baseUri = "http://202.53.174.5:8000/";
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

  Uri tableList (String id) => restaurants("availabletable/$id");
}
