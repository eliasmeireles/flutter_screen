import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen/flutter_screen.dart';

class TextEditDecorated extends StatelessWidget {
  static final Color disabledColor = Colors.grey[500] ?? Colors.grey;
  final TextEditingController? controller;
  final String? label;
  final int? maxLength;
  final int minimumLine;
  final int maxLines;
  final bool enable;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool readOnly;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool obscureText;
  final IconData? iconData;
  final Color? labelColor;
  final Color? disabledBorderColor;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function? onChange;
  final Function? onTap;
  final Color? borderColor;
  final Widget? suffix;
  final ParentStyle? parentStyle;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;

  const TextEditDecorated({
    Key? key,
    this.keyboardType,
    this.label,
    this.iconData,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.onChange,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.minimumLine = 1,
    this.maxLength,
    this.enable = true,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.labelColor,
    this.borderColor,
    this.disabledBorderColor,
    this.suffix,
    this.parentStyle,
    this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> formatters = [
      LengthLimitingTextInputFormatter(maxLength),
    ];

    if (inputFormatters != null) {
      formatters.addAll(inputFormatters!);
    }

    return Parent(
      style: parentStyle ?? defaultParentStyle(MediaQuery.of(context).size),
      child: TextFormField(
        autofillHints: const [''],
        controller: controller,
        onTap: onTap?.call(),
        minLines: minimumLine,
        cursorColor: labelColor,
        textCapitalization: textCapitalization!,
        onChanged: (value) {
          if (onChange != null) {
            onChange!(value.trim());
          }
        },
        focusNode: focusNode,
        readOnly: readOnly,
        maxLines: maxLines,
        textInputAction: textInputAction,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        enabled: enable,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: labelColor ?? context.primaryColor),
        inputFormatters: formatters,
        obscuringCharacter: "*",
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        decoration: InputDecoration(
          suffixIcon: suffix,
          focusColor: borderColor ?? context.primaryColor,
          contentPadding: const EdgeInsets.all(DEFAULT_PADDING_LINE_TEXT),
          focusedBorder:
              buildOutlineInputBorder(borderColor ?? context.primaryColor),
          enabledBorder:
              buildOutlineInputBorder(borderColor ?? context.primaryColor),
          disabledBorder: buildOutlineInputBorder(getDisabledColor),
          errorBorder: buildOutlineInputBorder(Colors.red),
          hintText: hintText,
          border: buildOutlineInputBorder(borderColor ?? context.primaryColor),
          prefixIcon: iconData != null
              ? Icon(
                  iconData,
                  color: borderColor ?? context.primaryColor,
                )
              : null,
          labelText: label,
          labelStyle: TextStyle(color: borderColor ?? context.primaryColor),
        ),
      ),
    );
  }

  Color get getDisabledColor => disabledBorderColor ?? Colors.grey[500]!;
}
