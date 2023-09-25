import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final box = GetStorage();
  static const String isSignIn = "isSignIn";
  static const String tokenJWT = "tokenJWT";
  static const String idUser = "idUser";
  static const String email = "email";
  static const String username = "username";
}
