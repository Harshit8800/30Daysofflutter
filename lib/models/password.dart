// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PasswordModel {
  static List<LoginPassword>? passw;
}

class LoginPassword {
  final num? mobile;
  final num? otp;

  LoginPassword(
    this.mobile,
    this.otp,
  );

  LoginPassword copyWith({
    num? mobile,
    num? otp,
  }) {
    return LoginPassword(
      mobile ?? this.mobile,
      otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobile': mobile,
      'otp': otp,
    };
  }

  factory LoginPassword.fromMap(Map<String, dynamic> map) {
    return LoginPassword(
      map['mobile'] != null ? map['mobile'] as num : null,
      map['otp'] != null ? map['otp'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginPassword.fromJson(String source) =>
      LoginPassword.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginPassword(mobile: $mobile, otp: $otp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginPassword && other.mobile == mobile && other.otp == otp;
  }

  @override
  int get hashCode => mobile.hashCode ^ otp.hashCode;
}
