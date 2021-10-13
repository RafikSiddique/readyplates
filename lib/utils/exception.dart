class AppException implements Exception {
  final String? message;
  AppException({int? code, this.message});
  @override
  String toString() {
    if (message != null) {
      return message!;
    } else {
      return "Something went wrong";
    }
  }
}
