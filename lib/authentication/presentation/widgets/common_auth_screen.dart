import 'package:flutter/material.dart';
import 'package:zogx_ev_app_2/common/design/layout.dart';

class CommonAuthScreen extends StatefulWidget {
  final String headingText;
  final String descriptionText;
  final Function(String?)? saveCallback;
  final String? Function(String?)? validatorCallback;
  final String buttonText;
  final String hintText;
  final bool isCode;
  final Widget? textFieldPrefix;
  final TextInputType? keyboardType;
  const CommonAuthScreen({
    super.key,
    required this.headingText,
    required this.descriptionText,
    this.saveCallback,
    this.validatorCallback,
    required this.buttonText,
    required this.hintText,
    this.textFieldPrefix,
    this.keyboardType,
    this.isCode = false,
  });

  @override
  State<CommonAuthScreen> createState() => _CommonAuthScreenState();
}

class _CommonAuthScreenState extends State<CommonAuthScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultAllSidePadding),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.headingText,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                Text(
                  widget.descriptionText,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: kDefaultColumnWidgetSpacing,
                ),
                TextFormField(
                  maxLength: (widget.isCode) ? 4 : null,
                  // textAlign:
                  //     (widget.isCode) ? TextAlign.center : TextAlign.start,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    prefixIcon: widget.textFieldPrefix,
                    prefixIconConstraints:
                        const BoxConstraints(minHeight: 0.0, minWidth: 0.0),
                    border: const UnderlineInputBorder(),
                    hintText: widget.hintText,
                  ),
                  validator: widget.validatorCallback,
                  onSaved: widget.saveCallback,
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                    }
                  },
                  child: Text(widget.buttonText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCodeInputField extends StatelessWidget {
  const CustomCodeInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        const Spacer(),
        Text("Code"),
      ],
    );
  }
}
