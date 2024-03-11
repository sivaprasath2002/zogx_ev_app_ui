import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/authentication/data_provider/auth_provider.dart';
import 'package:zogx_ev_app_2/authentication/presentation/widgets/common_auth_screen.dart';
import 'package:zogx_ev_app_2/authentication/strings.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/common/validators/validator.dart';

class AuthOtpScreen extends StatefulWidget {
  const AuthOtpScreen({super.key});

  @override
  State<AuthOtpScreen> createState() => _AuthOtpScreenState();
}

class _AuthOtpScreenState extends State<AuthOtpScreen> {
  Future<void> onTap(String otp) async {
    final message = await verifyOtp(otp);
    if (message != 'success') {
      onFailure(message);
    } else {
      onSuccess();
    }
  }

  void onSuccess() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      codeAuthScreenRoute,
      (route) => false,
    );
  }

  void onFailure(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          error,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonAuthScreen(
      keyboardType: TextInputType.number,
      headingText: authOtpScreenScreenHeading,
      descriptionText: authOtpScreenScreenDescription,
      saveCallback: (str) {
        onTap(str!);
      },
      validatorCallback: Validators.numberValidatorCallback,
      buttonText: authOtpScreenScreenButtonText,
      hintText: authOtpScreenScreenIntputFieldHintText,
    );
  }
}
