import 'package:shared_preferences/shared_preferences.dart';

class TokenService {


    Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('jwt');
      return token;
    } catch (e) {
      print('Error al obtener el token: $e');
      return null;
    }
  }
}
