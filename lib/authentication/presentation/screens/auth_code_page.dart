import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/authentication/presentation/widgets/common_auth_screen.dart';
import 'package:zogx_ev_app_2/authentication/strings.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';

class AuthCodePage extends StatelessWidget {
  const AuthCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAuthScreen(
      headingText: authCodeScreenScreenHeading,
      descriptionText: authCodeScreenScreenDescription,
      buttonText: authCodeScreenScreenButtonText,
      hintText: authCodeScreenScreenIntputFieldHintText,
      validatorCallback: (str) {
        if (str != null && str.length < 4) {
          return "Enter a valid code";
        }
        return null;
      },
      saveCallback: (code) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          loactionPermissionScreenRoute,
          (route) => false,
        );
      },
      keyboardType: TextInputType.number,
      isCode: true,
    );
  }
}
