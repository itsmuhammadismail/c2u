import 'package:c2u/features/user/data/model/region_model.dart';
import 'package:c2u/features/user/data/model/subbie_model.dart';
import 'package:c2u/features/user/data/model/trade_model.dart';
import 'package:c2u/features/user/data/model/user_model.dart';
import 'package:c2u/features/user/presentation/screens/profile/widgets/contractor_profile_model.dart';
import 'package:c2u/features/user/presentation/screens/signup/widgets/subbie_signup.dart';
import 'package:c2u/features/user/presentation/screens/subbie_profile/widgets/profile_model.dart';
import 'package:c2u/shared/network/network.dart';
import 'dart:developer';

class UserRemoteDataSource {
  Future<UserModel> login(
    String email,
    String password,
    String userType,
  ) async {
    Map<String, String> data = {
      "email": email,
      "password": password,
      "user_type[]": userType,
      "remember": "true",
    };

    try {
      var res = await NetworkHelper.post(
        url: 'auth/authenticate',
        data: data,
      );

      if (userType.toLowerCase() != res['data']['user']['type']) {
        throw Exception('User not found');
      }

      UserModel user = UserModel.fromJson(res);
      print("user after json");
      return user;
    } catch (e) {
      log(e.toString());
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

    try {
      var res = await NetworkHelper.post(
        url: 'auth/signup',
        data: data,
      );

      UserModel user = UserModel.fromJson(res);

      return user;
    } catch (e) {
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

      return res["message"];
    } catch (e) {
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

      List<RegionModel> regions = res['data']['data']
          .map<RegionModel>((item) => RegionModel.fromJson(item))
          .toList();
      return regions;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SubbieModel>> subbies(
    String token,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'subbie?status=active',
        token: token,
      );

      List<SubbieModel> subbies = res['data']['data']
          .map<SubbieModel>((item) => SubbieModel.fromJson(item))
          .toList();
      return subbies;
    } catch (e) {
      rethrow;
    }
  }

  Future<ProfileModel> getSubbiesData(
    String token,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'subbie_profile',
        token: token,
      );

      ProfileModel subbies = ProfileModel.fromJson(res['data']);

      return subbies;
    } catch (e) {
      rethrow;
    }
  }

  Future<ContractorProfileModel> getContractorData(
    String token,
  ) async {
    try {
      var res = await NetworkHelper.get(
        url: 'contractor_profile',
        token: token,
      );

      ContractorProfileModel contractor =
          ContractorProfileModel.fromJson(res['data']);

      print("going from data source");

      return contractor;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<String> updateProfile(
    String token,
    ProfileModel profile,
  ) async {
    Map<String, String> data = {
      'first_name': profile.firstName,
      'last_name': profile.lastName,
      'user_type': 'subbie',
      'email': profile.email,
      'phone_number': profile.phoneNumber,
      'trading_name': profile.tradingName,
      'abn': profile.abn,
      'gst_registered': profile.gstRegistered,
      'business_structure': profile.businessAddressLine1,
      'business_address_line1': profile.businessAddressLine1,
      'business_address_line2': profile.businessAddressLine2,
      'city': profile.city,
      'state': profile.state,
      'postal_code': profile.postalCode,
      'other_number': profile.otherNumber,
      'website_url': profile.website,
      'trades[]': profile.trades,
      'regions[]': profile.regions,
      'available_emergency': profile.availableEmergency,
      'public_liability_company': profile.liabilityCompany,
      'public_liability_policy_number': profile.liabilityPolicyNumber,
      'public_liability_expiry_date': profile.expiryDate,
      'public_liability_cover_value': profile.valueOfCover,
      'construction_safty_card_number': profile.constructionSafetyCardNumber,
      'driving_license_number': profile.drivingLicenceExpiryDate,
      'driving_license_expiry_date': profile.drivingLicenceExpiryDate,
      'regulatory_body_license_number': profile.regulatoryBodyLicenceNumber,
      'regulatory_body_license_expiry_date': profile.regulatoryBodyExpiryDate,
      'work_cover_policy_number': profile.workCoverPolicyNumber,
      'work_cover_policy_expiry_date': profile.workCoverExpiryDate,
      'local_legislation': profile.localLegislation,
      'notes': profile.notes,
    };

    Map files = {
      'certificate_currency': profile.certificateCurrency,
      'profile_image': profile.profileImage,
      'construction_safty_card': profile.constructionSaftyCard,
      'driving_license': profile.drivingLicence,
      'regulatory_body_license': profile.regulatoryBodyLicence,
      'workcover_certificate_currency': profile.workCoverCertificateCurrency,
      'swms': profile.swms,
      'subbie_capability_documents': profile.subbieCapabilityDocument,
    };

    try {
      var res = await NetworkHelper.postWithFiles(
        token: token,
        url: 'subbie_profile/update',
        data: data,
        files: files,
      );

      return res["error"].toString();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<String> updateContractorProfile(
    String token,
    ContractorProfileModel profile,
  ) async {
    Map<String, String> data = {
      'first_name': profile.firstName,
      'last_name': profile.lastName,
      'user_type': profile.type,
      'email': profile.email,
      'phone_number': profile.phoneNumber,
      'business_name': profile.bussinessName,
      'abn': profile.abn,
      'business_address_line1': profile.addressLine1,
      'business_address_line2': profile.addressLine2,
      'city': profile.city,
      'state': profile.state,
      'postal_code': profile.postalCode,
      'other_number': profile.otherNumber!,
    };

    try {
      var res = await NetworkHelper.postWithImage(
        token: token,
        url: 'contractor_profile/update',
        data: data,
        image: profile.profileImage,
      );

      return res["error"].toString();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
