import 'package:olx_clone/models/user.dart';
import 'package:olx_clone/repositories/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'table_keys.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<int>(keyUserType, user.userType.index);
    parseUser.set<String>(keyUserPhone, user.phone!);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(parseUser);
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
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<User?> currentUser() async {
    final ParseUser? parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);
      if (response != null && response.success) {
        return mapParseToUser(parseUser);
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      email: parseUser.get(keyUserLogin),
      name: parseUser.get(keyUserName),
      phone: parseUser.get(keyUserPhone),
      userType: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreateAt),
      id: parseUser.get(keyUserId),
    );
  }

  Future<void> save(User user) async {
    final ParseUser parseUser = await ParseUser.currentUser();

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone!);
    parseUser.set<int>(keyUserType, user.userType.index);

    if (user.password != null) {
      parseUser.password = user.password;
    }

    final response = await parseUser.save();

    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }

    if (user.password != null) {
      logout();
      
      await logInWithEmail(email:user.email,password: user.password!);
    }
  }

  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout();
  }
}
