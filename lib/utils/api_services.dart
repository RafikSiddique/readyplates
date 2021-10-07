class ApiService {
  final contentTypeJsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  final String baseUri = "https://readyplates.herokuapp.com/";
  Uri accounts(String path) => Uri.parse(baseUri + "accounts/" + path);
  Uri get loginUri => accounts('login/');
  Uri get registerUri => accounts('register/');
  Uri get image => accounts('image/');
}
