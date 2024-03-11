import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> verifyPhoneNumber(String phoneNumber) async {
  final dio = Dio();
  const result = 'SUCCESS';
  return result.toLowerCase();
}

Future<String> verifyOtp(String otp) async {
  final dio = Dio();
  const result = 'SUCCESS';
  const token = 'mockTocken';
  const FlutterSecureStorage().write(key: 'token', value: token);
  return result.toLowerCase();
}
