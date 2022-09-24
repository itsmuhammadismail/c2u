import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/shared/network/network.dart';

class UserRemoteDataSource {
  Future<UserModel> login(
    String email,
    String password,
    String userType,
  ) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
      "user_type": userType,
      "remember": "true",
    };

    try {
      var res = await NetworkHelper.post(
        url: 'auth/authenticate',
        data: data,
      );

      UserModel user = UserModel.fromJson(res);
      print(user);
      return user;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<String> forgetPassword(
    String email,
  ) async {
    Map<String, String> data = {
      "email": email,
    };

    try {
      var res = await NetworkHelper.post(
        url: 'auth/password/forgot-password',
        data: data,
      );

      print(res);

      return res["message"];
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }

  Future<String> changePassword(
    String token,
    String currentPassword,
    String password,
    String confirmassword,
  ) async {
    Map<String, String> data = {
      "current_password": currentPassword,
      "password": password,
      "confirm_password": confirmassword,
    };

    print(data);

    try {
      var res = await NetworkHelper.post(
        token: token,
        url: 'auth/change_password',
        data: data,
      );

      print(res);

      return res["message"];
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }

  Future<String> accountSetting(
    String token,
    String? image,
    String firstName,
    String lastName,
    String userType,
    String email,
    String phone,
  ) async {
    Map<String, String> data = {
      "first_name": firstName,
      "last_name": lastName,
      "user_type": userType,
      "email": email,
      "phone_number": phone,
    };

    print(data);

    try {
      var res = await NetworkHelper.postWithImage(
        token: token,
        url: 'auth/account_setting',
        data: data,
        image: image,
      );

      print(res);

      return res["message"];
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}
