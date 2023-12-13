import 'package:http/http.dart' as http;

class BaseUrl {
  static String baseUrl = "http://200.0.0.2/api/v1/";
  static String acc = baseUrl + "acc";
  static String user = baseUrl + "user";
  static String profileImage = baseUrl + "assets/img/profile/";
}

class API {
  static Future getUsers() {
    return http.get(Uri.parse(BaseUrl.user));
  }

  static Map<String, String>? headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
  };

  static Uri acc = Uri.parse(BaseUrl.acc);
  static Uri user = Uri.parse(BaseUrl.user);
  static Uri profileImage = Uri.parse(BaseUrl.profileImage);
}
