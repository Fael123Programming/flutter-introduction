import 'package:api_rest/models/user/user.dart';
import 'package:api_rest/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInHelper {
  Future<User?> signIn(String username, String password) async {
    if (username != password) {
      //To the sake of simplicity, all passwords must be equal to the username.
      return null;
    }
    UserService userService = UserService();
    User? user = await userService.getUserByUsername(username);
    if (user != null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setBool('logged', true);
      sharedPreferences.setInt('userId', user.id);
      sharedPreferences.setString('username', user.username);
    }
    return user;
  }

  Future<void> signOut() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('logged', false);
    sharedPreferences.remove('userId');
    sharedPreferences.remove('username');
  }

  Future<bool> isUserSignedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final logged = sharedPreferences.getBool('logged');
    if (logged == null) {
      return false;
    }
    return logged;
  }
}
