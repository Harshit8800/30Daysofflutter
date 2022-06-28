import 'dart:convert';

import 'package:flutter/services.dart';

class ApiServices {}

class LoginApiResponse {
  final int? mobile;
  final int? otp;

  LoginApiResponse(this.mobile, this.otp);
}
