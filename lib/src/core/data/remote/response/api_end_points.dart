class ApiEndPoints {
  //? Headers
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const String baseUrl = "https://test.kakas.app/api";

  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String products = "/products";

  //? Upload Files
  static const String upload = "https://test.kakas.app/api/upload";
}
