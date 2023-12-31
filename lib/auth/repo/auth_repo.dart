import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? value = prefs.getString('token');
    if (value != null) {
      print(value);
      return true;
    } else {
      return false;
    }
  }
}
