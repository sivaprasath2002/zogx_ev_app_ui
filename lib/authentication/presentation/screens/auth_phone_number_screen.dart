import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/authentication/data_provider/auth_provider.dart';
import 'package:zogx_ev_app_2/authentication/presentation/widgets/common_auth_screen.dart';
import 'package:zogx_ev_app_2/authentication/strings.dart';
import 'package:zogx_ev_app_2/common/routes/screen/routes.dart';
import 'package:zogx_ev_app_2/common/validators/validator.dart';

class AuthPhoneNumberScreen extends StatefulWidget {
  const AuthPhoneNumberScreen({
    super.key,
  });

  @override
  State<AuthPhoneNumberScreen> createState() => _AuthPhoneNumberScreenState();
}

class _AuthPhoneNumberScreenState extends State<AuthPhoneNumberScreen> {
  Country pickedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 0,
    name: "India",
    example: "1234567890",
    displayName: "India (IN) +91",
    displayNameNoCountryCode: "India (IN)",
    e164Key: "",
  );

  Future<void> onTap(String phoneNumber) async {
    final message = await verifyPhoneNumber(phoneNumber);
    if (message != 'success') {
      onFailure(message);
    } else {
      onSuccess();
    }
  }

  void onFailure(String error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
      ),
    );
  }

  void onSuccess() async {
    await Navigator.of(context).pushNamed(otpAuthScreenRoute);
  }

  @override
  Widget build(BuildContext context) {
    return CommonAuthScreen(
      headingText: authPhoneNumberScreenHeading,
      descriptionText: authPhoneNumberScreenDescription,
      keyboardType: TextInputType.phone,
      saveCallback: (str) async {
        debugPrint("+${pickedCountry.phoneCode}$str");
        final phoneNumberWithCode = "+${pickedCountry.phoneCode}$str";
        onTap(phoneNumberWithCode);
      },
      validatorCallback: Validators.numberValidatorCallback,
      buttonText: authPhoneNumberScreenButtonText,
      hintText: authPhoneNumberScreenIntputFieldHintText,
      textFieldPrefix: InkWell(
        onTap: () {
          showCountryPicker(
            countryListTheme: CountryListThemeData(
              backgroundColor: Theme.of(context).primaryColorDark,
              textStyle: const TextStyle(color: Colors.white),
            ),
            context: context,
            showPhoneCode: true,
            useSafeArea: true,
            onSelect: (value) {
              setState(() {
                pickedCountry = value;
              });
            },
          );
        },
        child: Text(
          "+${pickedCountry.phoneCode} ${pickedCountry.flagEmoji} ",
        ),
      ),
    );
  }
}
