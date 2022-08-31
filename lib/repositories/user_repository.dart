import 'package:olx_clone/models/user.dart';
import 'package:olx_clone/repositories/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'table_keys.dart';

class UserRepository {
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<int>(keyUserType, user.userType.index);

    final response = await parseUser.signUp();

    if (response.success) {
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User> logInWithEmail(
      {required String email, required String password}) async {
    final parseUser = ParseUser(email, password, email);

    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(parseUser);
    } else{
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      email: parseUser.get(keyUserEmail),
      name: parseUser.get(keyUserName),
      userType: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreateAt),
      id: parseUser.get(keyUserId),
    );
  }
}
