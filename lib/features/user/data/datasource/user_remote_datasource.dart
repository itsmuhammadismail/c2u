import 'package:c2u/features/user/data/model/region_model.dart';
import 'package:c2u/features/user/data/model/trade_model.dart';
import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
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

      print(res);

      UserModel user = UserModel.fromJson(res);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signup(SubbieSignup subbie) async {
    Map<String, String> data = {
      'first_name': subbie.firstName,
      'last_name': subbie.lastName,
      'email': subbie.email,
      'phone_number': subbie.phoneNumber,
      'password': subbie.password,
      'confirm_password': subbie.confirmPassword,
      'user_type': subbie.userType,
      'terms': subbie.terms,
    };

    print(data);

    try {
      var res = await NetworkHelper.post(
        url: 'auth/signup',
        data: data,
      );

      print("res");

      UserModel user = UserModel.fromJson(res);
      print(user);
      return user;
    } catch (e) {
      print("user remote");
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

      return res["message"];
    } catch (e) {
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
      rethrow;
    }
  }

  Future<List<TradeModel>> trade(
    String token,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'trade?status=active',
        token: token,
      );

      List<TradeModel> trades = res['data']['data']
          .map<TradeModel>((item) => TradeModel.fromJson(item))
          .toList();
      return trades;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RegionModel>> regions(
    String token,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'region?status=active',
        token: token,
      );

      List<RegionModel> trades = res['data']['data']
          .map<RegionModel>((item) => RegionModel.fromJson(item))
          .toList();
      return trades;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updateProfile(
    String token,
    ProfileModel profile,
  ) async {
    Map<String, String> data = {
      'first_name': profile.firstName,
      'user_type': 'subbie',
      'email': profile.email,
      'phone_number': profile.phoneNumber,
      'trading_name': profile.tradingName,
      'abn': profile.abn,
      'gst_registered': profile.gstRegistered,
      'business_structure': profile.businessAddressLine1,
      'business_address_line1': profile.businessAddressLine1,
      'city': profile.city,
      'state': profile.state,
      'postal_code': profile.postalCode,
      'other_number': profile.otherNumber,
      'website_url': profile.website,
      'trades[]': profile.trades,
      'regions[]': profile.regions,
      'available_emergency': profile.availableEmergency,
      'liability_company': profile.liabilityCompany,
      'liability_policy_number': profile.liabilityPolicyNumber,
      'expire_date': profile.expiryDate,
      'value_of_cover': profile.valueOfCover,
      'construction_safty_card_number': profile.constructionSafetyCardNumber,
      'driving_license_number': profile.drivingLicenceNumber,
      'regulatory_body_license_number': profile.regulatoryBodyLicenceNumber,
      'regulatory_body_expire_date': profile.regulatoryBodyExpiryDate,
      'workcover_policy_number': profile.workCoverPolicyNumber,
      'workcover_expire_date': profile.workCoverExpiryDate,
      'local_legislation': profile.localLegislation,
      'notes': profile.notes,
    };

    List<Map<String, String>> files = [
      {
        'file_name': 'certificate_currency',
        'file': profile.certificateCurrency,
      },
      {
        'file_name': 'construction_safty_card',
        'file': profile.constructionSaftyCard,
      },
      {
        'file_name': 'driving_license',
        'file': profile.drivingLicence,
      },
      {
        'file_name': 'regulatory_body_license',
        'file': profile.regulatoryBodyLicence,
      },
      {
        'file_name': 'workcover_certificate_currency',
        'file': profile.workCoverCertificateCurrency,
      },
      {
        'file_name': 'swms',
        'file': profile.swms,
      },
      {
        'file_name': 'subbie_capability_documents[]',
        'file': profile.subbieCapabilityDocument,
      },
    ];

    try {
      var res = await NetworkHelper.postWithFiles(
        token: token,
        url: 'subbie_profile/update',
        data: data,
        files: files,
      );

      print(res);

      return res["message"];
    } catch (e) {
      rethrow;
    }
  }
}
