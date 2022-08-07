import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

class SignInUtilsRepository {
  static const _storage = FlutterSecureStorage();
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    _storage.write(key: "accessToken", value: accessToken);
    _storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<bool> userHaveTokens() async {
    if (await _storage.read(key: "accessToken") != null &&
        await _storage.read(key: "refreshToken") != null) {
      return statusTokens();
    } else {
      return false;
    }
  }

  Future<void> logOut() async {
    _storage.delete(key: "accessToken");
    _storage.delete(key: "refreshToken");
  }

  Future<bool> statusTokens() async {
    Uri url = Uri.parse("https://api.delivery.spichka.dev/client/user-info");
    var tokenResponse = await https.get(url, headers: {
      'Authorization': 'Bearer ${await _storage.read(key: "accessToken")}'
    });

    if (tokenResponse.statusCode == 401) {
      try {
        return await refreshTokens();
      } catch (_) {
        logOut();
        return false;
      }
    } else {
      return true;
    }
  }

  Future<bool> refreshTokens() async {
    Uri url =
        Uri.parse("https://api.delivery.spichka.dev/authentication/refresh");
    var response = await https.post(url, body: {
      "refreshToken": _storage.read(key: "refreshToken"),
    });
    final String accessToken = jsonDecode(response.body)['accessToken'];
    final String refreshToken = jsonDecode(response.body)['refreshToken'];
    if (response.statusCode == 201) {
      saveTokens(accessToken, refreshToken);
      return true;
    } else {
      return false;
    }
  }
}
