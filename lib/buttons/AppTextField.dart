import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:zedpay/core/styles/dimensions.style.dart';

typedef OnChangedCallBack = Function(String value);

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final List<String>? autofillHints;
  // final String hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isDisabled;
  final bool isPassword;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final OnChangedCallBack? onChangedCallBack;
  final bool? enableInteractiveSelection;
  final VoidCallback? onTap;
  final List<String>? validationMessages;
  final Function(String)? onFieldTap;
  final FocusNode? focusNode;
  final bool? isFieldValid;

  const AppTextField({
    super.key,
    required this.controller,
    this.labelText,
    // required this.hintText,
    this.autofillHints,
    this.formatters,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.isPassword = false,
    this.maxLength,
    this.textCapitalization = TextCapitalization.words,
    this.enableInteractiveSelection = true,
    this.onChangedCallBack,
    this.onTap,
    this.validationMessages,
    this.onFieldTap,
    this.focusNode,
    this.isFieldValid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 139, 139, 139).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: isPassword,
            readOnly: isDisabled,
            inputFormatters: formatters,
            textCapitalization: textCapitalization,
            autofillHints: autofillHints,
            keyboardType: textInputType,
            maxLength: maxLength,
            buildCounter: (BuildContext context,
                {required int currentLength,
                required bool isFocused,
                required int? maxLength}) {
              if (textInputType == TextInputType.number && isFocused) {
                return Text(
                  '$currentLength/$maxLength',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                );
              }
              return null;
            },
            onChanged: (value) {
              if (onChangedCallBack != null) {
                onChangedCallBack!(value);
              }
              if (onFieldTap != null) {
                onFieldTap!(value);
              }
            },
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            enableInteractiveSelection: enableInteractiveSelection,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0,
                  color: isFieldValid ?? false
                      ? Colors.green.shade200
                      : Colors.red.shade200,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.grey)),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Color.fromARGB(108, 50, 50, 50),
                fontSize: 14,
              ),
              // hintText: hintText,
              hintStyle: const TextStyle(fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
            onTap: () {
              if (onFieldTap != null) {
                onFieldTap!(controller.text);
              }
              if (onTap != null) {
                onTap!();
              }
            },
          ),
        ),
        if (validationMessages != null && validationMessages!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: validationMessages!.map((message) {
                final isValid = !message.contains('error');
                return Row(
                  children: [
                    Icon(
                      isValid ? Icons.error : Icons.check_circle,
                      color: isValid ? Colors.red : Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: isValid ? Colors.red : Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
