class ApiService {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String baseUri = "http://202.53.174.5:8000/";
  Uri accounts(String path) => Uri.parse(baseUri + "accounts/" + path);
  Uri restaurants(String path) => Uri.parse(baseUri + "restaurants/" + path);
  Uri get loginUri => accounts('login/');
  Uri get registerUri => accounts('register/');
  Uri get image => accounts('image/');
  Uri menuList(String id) => restaurants('menulist/$id/');
  Uri get restaurantList => restaurants('get/');
  Uri get addToCart => restaurants('cart/');
  Uri cartList(String id) => restaurants('cart/$id');

  Uri orderList(String id) => restaurants('orders/$id'); //get

  Uri get ordersapi => restaurants("orders/"); //post

}
