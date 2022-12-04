import 'package:c2u/resources/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class NetworkHelper {
  static Future post({
    required String url,
    Map<String, String>? data,
    String token = '',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';

    var request = http.MultipartRequest('POST', Uri.parse('$kHost$url'));
    request.fields.addAll(data!);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      print(value);
      return jsonDecode(value);
    });

    print(res);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }

  static Future postWithImage({
    required String url,
    Map<String, String>? data,
    String? image,
    String token = '',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';

    var request = http.MultipartRequest('POST', Uri.parse('$kHost$url'));
    request.fields.addAll(data!);
    if (image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('profile_image', image));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    print("res");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }

  static Future postWithFiles({
    required String url,
    Map<String, String>? data,
    required Map files,
    String token = '',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';

    var request = http.MultipartRequest('POST', Uri.parse('$kHost$url'));
    request.fields.addAll(data!);
    request.files.add(await http.MultipartFile.fromPath(
        'profile_image', files['profile_image']));
    request.files.add(await http.MultipartFile.fromPath(
        'certificate_currency', files['certificate_currency']));
    request.files.add(await http.MultipartFile.fromPath(
        'construction_safty_card', files['construction_safty_card']));
    request.files.add(await http.MultipartFile.fromPath(
        'driving_license', files['driving_license']));
    request.files.add(await http.MultipartFile.fromPath(
        'regulatory_body_license', files['regulatory_body_license']));
    request.files.add(await http.MultipartFile.fromPath(
        'workcover_certificate_currency',
        files['workcover_certificate_currency']));
    request.files.add(await http.MultipartFile.fromPath('swms', files['swms']));
    request.files.add(await http.MultipartFile.fromPath(
        'capability_documents[]', files['subbie_capability_documents']));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    print(response);
    var res = await response.stream.bytesToString().then((value) {
      print(value);
      return jsonDecode(value);
    });

    print("res ${res.toString()}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }

  static Future postWithDocuments({
    required String url,
    Map<String, String>? data,
    required String file,
    String token = '',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';

    var request = http.MultipartRequest('POST', Uri.parse('$kHost$url'));
    request.fields.addAll(data!);
    if (file.length != 0) {
      request.files.add(await http.MultipartFile.fromPath('documents[]', file));
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    print("res");
    print(res);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }

  static Future get({
    required String url,
    Map<String, String>? data,
    String token = '',
  }) async {
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';
    print('$kHost$url');
    var request = http.Request('GET', Uri.parse('$kHost$url'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    print(res);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }
}
