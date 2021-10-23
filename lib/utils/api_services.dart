class ApiService {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String baseUri = "http://202.53.174.5:8000/";
  Uri accounts(String path) => Uri.parse(baseUri + "accounts/" + path);
  Uri get loginUri => accounts('login/');
  Uri get registerUri => accounts('register/');
  Uri get image => accounts('image/');
  Uri restaurantList() => Uri.parse(baseUri + 'restaurants/get/');
  Uri addToCart(String id) => Uri.parse(baseUri + 'restaurants/cart/$id');
  Uri cartList() => Uri.parse(baseUri + 'restaurants/cart/');
}
