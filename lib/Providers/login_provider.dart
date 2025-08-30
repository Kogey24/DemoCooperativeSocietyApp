import 'dart:convert';
import 'package:demo_cooperative_society/Models/memberreponse.dart'; // response model
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Exposes the latest login attempt result as AsyncValue<MemberResponse?>
final loginProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<MemberResponse?>>(
      (ref) => LoginNotifier(),
    );

class LoginNotifier extends StateNotifier<AsyncValue<MemberResponse?>> {
  LoginNotifier() : super(const AsyncValue.data(null));

  final Dio _dio = Dio();

  /// Logs in using cmusername + pass.
  /// - Sends JSON body: { "cmusername": "...", "pass": "..." }
  /// - Adds Basic Auth header using the same credentials
  /// - Returns parsed MemberResponse on 200
  Future<MemberResponse?> loginUser(String cmusername, String pass) async {
    state = const AsyncValue.loading();

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('WAr44TGHJHKeWERWE:GuYYT56UYKad9YTYYDDDSSe'))}';
    final payload = {"cmusername": cmusername, "pass": pass};

    // Debug: outbound
    debugPrint("🔵 Login POST https://cmx.leagpro.com/clogin");
    debugPrint("➡️ Payload: ${jsonEncode(payload)}");
    debugPrint("➡️ Authorization: $basicAuth");

    try {
      final response = await _dio.post(
        "https://cmx.leagpro.com/clogin",
        data: jsonEncode(payload),
        options: Options(
          headers: {
            "Authorization": basicAuth,
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          // Let us handle 4xx here without throwing
          validateStatus: (code) => code != null && code < 500,
        ),
      );

      // Debug: inbound
      debugPrint("🟢 Response [${response.statusCode}]: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is Map
            ? Map<String, dynamic>.from(response.data as Map)
            : jsonDecode(response.data as String) as Map<String, dynamic>;

        final memberResponse = MemberResponse.fromJson(data);
        state = AsyncValue.data(memberResponse);
        return memberResponse;
      } else {
        // Try to extract message from body for nicer errors
        String apiMessage = "Login failed [${response.statusCode}]";
        final body = response.data;
        if (body is Map && body["message"] != null) {
          apiMessage = body["message"].toString();
        } else if (body is String && body.isNotEmpty) {
          apiMessage = body;
        }
        final err = Exception(apiMessage);
        state = AsyncValue.error(err, StackTrace.current);
        throw err;
      }
    } on DioException catch (e, st) {
      String friendly = e.message ?? "Network error";
      final body = e.response?.data;
      if (body is Map && body["message"] != null) {
        friendly = body["message"].toString();
      } else if (body is String && body.isNotEmpty) {
        friendly = body;
      }
      debugPrint("❌ DioException: $friendly");
      state = AsyncValue.error(Exception(friendly), st);
      rethrow;
    } catch (e, st) {
      debugPrint("❌ Unexpected error: $e");
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
