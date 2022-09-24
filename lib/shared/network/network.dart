import 'package:c2u/resources/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  static Future post({
    required String url,
    Map<String, String>? data,
    String token = '',
  }) async {
    print("token $token");
    Map<String, String> headers = {};
    headers['Authorization'] = 'Bearer $token';

    var request = http.MultipartRequest('POST', Uri.parse('$kHost$url'));
    request.fields.addAll(data!);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

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
    print("token $token");
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

    var request = http.Request('GET', Uri.parse('$kHost$url'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return res;
    } else {
      throw Exception(res['message']);
    }
  }
}
